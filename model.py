import math
import torch
import torch.nn as nn
import numpy as np
import torch.nn.functional as F
from collections import OrderedDict
from torch.nn import Sequential, Linear, ReLU
from torch_geometric.nn import GCNConv, GATConv, GINConv
from torch_geometric.nn import global_mean_pool, global_max_pool, global_add_pool


class MENDTA(torch.nn.Module):
    def __init__(self, n_output=1, num_features_mol=80, num_features_pro=35,
                 n_filters=32, embed_dim=128, output_dim=128, dropout=0.2,
                 dmax_length=100, dv_size=63, tmax_length=850, tv_size=26):
        super(MENDTA, self).__init__()

        self.dropout = nn.Dropout(dropout)
        self.relu = nn.ReLU()
        self.n_output = n_output

        # ================= 药物端图特征提取 (GIN) =================
        self.mol_conv1 = GINConv(Sequential(Linear(num_features_mol, num_features_mol * 4), ReLU(),
                                        Linear(num_features_mol * 4, num_features_mol * 4)))
        self.bn1 = torch.nn.BatchNorm1d(num_features_mol * 4)
        self.mol_conv2 = GINConv(Sequential(Linear(num_features_mol * 4, num_features_mol * 4), ReLU(),
                                        Linear(num_features_mol * 4, num_features_mol * 4)))
        self.bn2 = torch.nn.BatchNorm1d(num_features_mol * 4)
        self.mol_conv3 = GATConv(num_features_mol * 4, num_features_mol * 4, heads=2, concat=False)
        self.mol_fc_g1 = torch.nn.Linear(num_features_mol * 4, 1024)
        self.mol_fc_g2 = torch.nn.Linear(1024, output_dim)

        # ================= 靶点端图特征提取 (GCN) =================
        self.pro_conv1 = GCNConv(num_features_pro, num_features_pro)
        self.pro_conv2 = GCNConv(num_features_pro, num_features_pro * 2)
        self.pro_conv3 = GATConv(num_features_pro * 2, num_features_pro * 4, heads=2, concat=False)
        self.pro_fc_g1 = torch.nn.Linear(num_features_pro * 4, 1024)
        self.pro_fc_g2 = torch.nn.Linear(1024, output_dim)


        # ================= 药物端序列特征提取 (Transformer + CNN) =================
        self.drug_transformer = Transformer(dmax_length, dv_size)
        self.conv_smi_1 = nn.Conv1d(in_channels=dmax_length, out_channels=n_filters, kernel_size=8)
        self.fc1_smi = nn.Linear(32 * 121, output_dim)

        # ================= 靶点端序列特征提取 (Transformer + CNN) =================
        self.target_transformer = Transformer(tmax_length, tv_size)
        self.conv_xt_1 = nn.Conv1d(in_channels=tmax_length, out_channels=n_filters, kernel_size=8)
        self.fc1_xt = nn.Linear(32 * 121, output_dim)

        # ====================================================================
        self.property_encoder = PropertiesEncoder(input_dim=18, output_dim=128)

        # 药物指纹
        self.mlp_fp = nn.Sequential(
            nn.Linear(1632, 1024),
            nn.ReLU(),
            nn.Dropout(0.1),
            nn.Linear(1024, 512),
            nn.ReLU(),
            nn.Dropout(0.1),
            nn.Linear(512, 128)
        )

        self.des_linear = nn.Linear(768, 256)
        self.self_attention = SelfAttention(256)

        # ================= 对比学习损失 =================
        self.constrast1 = SupConLoss(temperature=0.5)
        self.constrast2 = SupConLoss(temperature=0.8)

        # ================= 最终融合与预测层 =================
        self.fc1 = nn.Linear(output_dim * 8, 1024)
        self.fc2 = nn.Linear(1024, 256)
        self.out = nn.Linear(256, self.n_output)

    def forward(self, drugs, targets, label=None):
        # ================= 药物图特征 =================
        drug_graph = drugs.f2
        x = drug_graph.x
        edge_index = drug_graph.edge_index

        x = self.mol_conv1(x, edge_index)
        x = self.relu(x)
        x = self.mol_conv2(x, edge_index)
        x = self.relu(x)
        x = self.mol_conv3(x, edge_index)
        x = self.relu(x)
        drug_atom, drug_motif, drug_super_node = group_node(x, drug_graph.batch, drug_graph.atom_size, drug_graph.mol_size)

        # ================= 靶点图特征 =================
        target_graph = targets.f2
        target_x = target_graph.x
        target_edge_index = target_graph.edge_index

        xt = self.pro_conv1(target_x, target_edge_index)
        xt = self.relu(xt)
        xt = self.pro_conv2(xt, target_edge_index)
        xt = self.relu(xt)
        xt = self.pro_conv3(xt, target_edge_index)
        xt = self.relu(xt)
        target_residue, target_pocket, target_super_node = group_node(xt, target_graph.batch,  target_graph.residue_size, target_graph.target_size)

        drug_atom = torch.stack([torch.sum(atom, dim=0) for atom in drug_atom], dim=0)
        target_residue = torch.stack([torch.sum(residue, dim=0) for residue in target_residue], dim=0)
        drug_motif = torch.stack([torch.sum(motif, dim=0) for motif in drug_motif], dim=0)
        target_pocket = torch.stack([torch.sum(pocket, dim=0) for pocket in target_pocket], dim=0)
        drug_super_node = torch.stack([node.squeeze(0) for node in drug_super_node], dim=0)
        target_super_node = torch.stack([node.squeeze(0) for node in target_super_node], dim=0)

        drug_graph = torch.stack([drug_atom, drug_motif, drug_super_node], dim=1)
        drug_graph = drug_graph.mean(dim=1)
        drug_graph = self.relu(self.mol_fc_g1(drug_graph))
        drug_graph = self.dropout(drug_graph)
        drug_graph = self.mol_fc_g2(drug_graph)
        drug_graph = self.dropout(drug_graph)

        target_graph = torch.stack([target_residue, target_pocket, target_super_node], dim=1)
        target_graph = target_graph.mean(dim=1)
        target_graph = self.relu(self.pro_fc_g1(target_graph))
        target_graph = self.dropout(target_graph)
        target_graph = self.pro_fc_g2(target_graph)
        target_graph = self.dropout(target_graph)

        # ================= 药物序列特征 =================
        embedding_smiles = self.drug_transformer(drugs.f1)
        conv_xd = self.conv_smi_1(embedding_smiles)
        embedded_smiles = conv_xd.view(-1, 32 * 121)  # 确保这里展平的维度与 fc1_smi 匹配
        embedded_smiles = self.fc1_smi(embedded_smiles)

        # ================= 靶点序列特征 =================
        embedded_sequence = self.target_transformer(targets.f1)
        conv_xt = self.conv_xt_1(embedded_sequence)
        embedded_sequence = conv_xt.view(-1, 32 * 121)  # 确保这里展平的维度与 fc1_xt 匹配
        embedded_sequence = self.fc1_xt(embedded_sequence)

        # ================= 药靶描述特征 =================
        # 药物指纹
        drug_fp_embedding = self.mlp_fp(drugs.f4)  # [batch_size, output_dim]
        #drug_desc_feat = drug_fp_embedding
        drug_properity_feat = self.property_encoder(drugs.f3)
        drug_desc_feat = torch.cat((drug_fp_embedding, drug_properity_feat), 1)

        prot_h = self.des_linear(targets.f3)
        prot_fused = self.self_attention(prot_h)
        target_desc_feat = prot_fused.mean(dim=1)

        # ================= 对比学习与模态融合 =================
        drug_con1 = self.constrast1(drug_graph, embedded_smiles, labels=None, mask=None)
        compound_embedding = torch.cat((drug_graph, embedded_smiles), 1)
        drug_con2 = self.constrast2(compound_embedding, drug_desc_feat, labels=None, mask=None)
        xd = torch.cat((compound_embedding, drug_desc_feat), 1)

        pro_con1 = self.constrast1(target_graph, embedded_sequence, labels=None, mask=None)
        protein_embedding = torch.cat((target_graph, embedded_sequence), 1)
        pro_con2 = self.constrast2(protein_embedding, target_desc_feat, labels=None, mask=None)
        xp = torch.cat((protein_embedding, target_desc_feat), 1)

        xc = torch.cat((xd, xp), 1)

        # 总对比损失
        con_loss = drug_con1 + drug_con2 + pro_con1 + pro_con2

        # ================= 最终预测 =================

        xc = self.fc1(xc)
        xc = self.relu(xc)
        xc = self.dropout(xc)
        xc = self.fc2(xc)
        xc = self.relu(xc)
        xc = self.dropout(xc)
        out = self.out(xc)

        return out, con_loss


def group_node(x, batch, residue_size, target_size):
    batch_size = residue_size.shape[0]

    # 1. 首先按样本(batch)将节点特征拆分成列表
    # x_split 是一个长度为 batch_size 的列表，每个元素是该样本的所有节点特征
    x_split = torch.split(x, batch.bincount().tolist())

    target_residue = []
    target_pocket = []
    target_super_node = []

    # 2. 遍历每个样本，按节点类型进行切片
    for i in range(batch_size):
        sample_x = x_split[i]  # 当前样本的所有节点特征 [target_size_i, feat_dim]

        res_size = residue_size[i].item()  # 当前样本的残基数
        tot_size = target_size[i].item()  # 当前样本的总节点数

        # 切片 1: 残基节点 [0, res_size)
        residue_feat = sample_x[:res_size]
        target_residue.append(residue_feat)

        # 切片 2: 口袋节点 [res_size, tot_size - 1)
        # 注意：超级节点只有1个，位于最后
        pocket_feat = sample_x[res_size: tot_size - 1]
        target_pocket.append(pocket_feat)

        # 切片 3: 超级节点 [tot_size - 1, tot_size)
        super_feat = sample_x[tot_size - 1: tot_size]
        target_super_node.append(super_feat)

    return target_residue, target_pocket, target_super_node



class QuickGELU(nn.Module):
	def forward(self, x: torch.Tensor):
		return x * torch.sigmoid(1.702 * x)

class SelfAttention(nn.Module):
	def __init__(self, d_model: int, add_bias_kv: bool = False,num_heads = 16,dropout: float = 0.,):
		super().__init__()
		self.attn = nn.MultiheadAttention(d_model, num_heads, add_bias_kv=add_bias_kv,
										  dropout=dropout,  batch_first=True)
		self.ln_1 = nn.LayerNorm(d_model)
		self.mlp = nn.Sequential(OrderedDict([
			("c_fc", nn.Linear(d_model, d_model * 4)),
			("gelu", QuickGELU()),
			("c_proj", nn.Linear(d_model * 4, d_model))
		]))
		self.ln_2 = nn.LayerNorm(d_model)

	def attention(self, x: torch.Tensor, key_padding_mask: torch.Tensor = None):
		return self.attn(x.clone(), x, x, need_weights=False, key_padding_mask=key_padding_mask)[0]

	def forward(self, x: torch.Tensor, key_padding_mask: torch.Tensor = None):
		x = x + self.attention(self.ln_1(x), key_padding_mask=key_padding_mask)
		x = x + self.mlp(self.ln_2(x))
		return x


class PropertiesEncoder(nn.Module):

    def __init__(self, input_dim, hidden_dim=128, output_dim=128, device=None, dropout=0.1):
        super().__init__()

        self.norm = nn.LayerNorm(input_dim)

        self.mlp = nn.Sequential(
            nn.Linear(input_dim, hidden_dim),
            nn.GELU(),
            nn.Dropout(dropout),
            nn.Linear(hidden_dim, output_dim)
        )

        self.out_norm = nn.LayerNorm(output_dim)

    def forward(self, x):
        x = self.norm(x)
        x = self.mlp(x)
        return self.out_norm(x)


class Transformer(nn.Module):
    def __init__(self, max_length, v_size):
        super(Transformer, self).__init__()
        self.encoder = Encoder(max_length, v_size)  ## 编码层

    def forward(self, enc_inputs):
        enc_outputs, enc_self_attns = self.encoder(enc_inputs)
        return enc_outputs


## 2. Encoder 部分包含三个部分：词向量embedding，位置编码部分，注意力层及后续的前馈神经网络
class Encoder(nn.Module):
    def __init__(self, max_len, src_vocab_size, d_model=128, n_layers=2):
        super(Encoder, self).__init__()
        self.src_emb = nn.Embedding(src_vocab_size, d_model)  ## 这个其实就是去定义生成一个矩阵，大小是 src_vocab_size * d_model
        self.pos_emb = PositionalEncoding(d_model,
                                          max_len)  ## 位置编码情况，这里是固定的正余弦函数，也可以使用类似词向量的nn.Embedding获得一个可以更新学习的位置编码
        self.layers = nn.ModuleList(
            [EncoderLayer() for _ in range(n_layers)])  ## 使用ModuleList对多个encoder进行堆叠，因为后续的encoder并没有使用词向量和位置编码，所以抽离出来；

    def forward(self, enc_inputs):
        enc_outputs = self.src_emb(enc_inputs)
        enc_outputs = self.pos_emb(enc_outputs.transpose(0, 1)).transpose(0, 1)
        enc_self_attn_mask = get_attn_pad_mask(enc_inputs, enc_inputs)
        enc_self_attns = []
        for layer in self.layers:
            enc_outputs, enc_self_attn = layer(enc_outputs, enc_self_attn_mask)
            enc_self_attns.append(enc_self_attn)
        return enc_outputs, enc_self_attns


## 3. PositionalEncoding 代码实现
class PositionalEncoding(nn.Module):
    def __init__(self, d_model, max_len, dropout=0.1):
        super(PositionalEncoding, self).__init__()

        self.dropout = nn.Dropout(p=dropout)

        pe = torch.zeros(max_len, d_model)
        position = torch.arange(0, max_len, dtype=torch.float).unsqueeze(1)
        div_term = torch.exp(torch.arange(0, d_model, 2).float() * (-math.log(10000.0) / d_model))
        pe[:, 0::2] = torch.sin(position * div_term)  ## 这里需要注意的是pe[:, 0::2]这个用法，就是从0开始到最后面，补长为2，其实代表的就是偶数位置
        pe[:, 1::2] = torch.cos(position * div_term)  ##这里需要注意的是pe[:, 1::2]这个用法，就是从1开始到最后面，补长为2，其实代表的就是奇数位置

        pe = pe.unsqueeze(0).transpose(0, 1)

        self.register_buffer('pe', pe)  ## 定一个缓冲区，其实简单理解为这个参数不更新就可以

    def forward(self, x):
        """
        x: [seq_len, batch_size, d_model]
        """
        x = x + self.pe[:x.size(0), :]
        return self.dropout(x)


def get_attn_pad_mask(seq_q, seq_k):
    batch_size, len_q = seq_q.size()
    batch_size, len_k = seq_k.size()
    # eq(zero) is PAD token
    pad_attn_mask = seq_k.data.eq(0).unsqueeze(1)  # batch_size x 1 x len_k, one is masking
    return pad_attn_mask.expand(batch_size, len_q, len_k)  # batch_size x len_q x len_k


## 5. EncoderLayer ：包含两个部分，多头注意力机制和前馈神经网络
class EncoderLayer(nn.Module):
    def __init__(self):
        super(EncoderLayer, self).__init__()
        self.enc_self_attn = MultiHeadAttention()
        self.pos_ffn = PoswiseFeedForwardNet()

    def forward(self, enc_inputs, enc_self_attn_mask):
        ## 下面这个就是做自注意力层，输入是enc_inputs，形状是[batch_size x seq_len_q x d_model] 需要注意的是最初始的QKV矩阵是等同于这个输入的，去看一下enc_self_attn函数 6.
        enc_outputs, attn = self.enc_self_attn(enc_inputs, enc_inputs, enc_inputs,
                                               enc_self_attn_mask)  # enc_inputs to same Q,K,V
        enc_outputs = self.pos_ffn(enc_outputs)  # enc_outputs: [batch_size x len_q x d_model]
        return enc_outputs, attn


## 6. MultiHeadAttention
class MultiHeadAttention(nn.Module):
    def __init__(self, d_model=128, d_k=32, d_v=32, n_heads=2):
        super(MultiHeadAttention, self).__init__()
        ## 输入进来的QKV是相等的，我们会使用映射linear做一个映射得到参数矩阵Wq, Wk,Wv
        self.W_Q = nn.Linear(d_model, d_k * n_heads)
        self.W_K = nn.Linear(d_model, d_k * n_heads)
        self.W_V = nn.Linear(d_model, d_v * n_heads)
        self.linear = nn.Linear(n_heads * d_v, d_model)
        self.layer_norm = nn.LayerNorm(d_model)

    def forward(self, Q, K, V, attn_mask, d_k=32, d_v=32, n_heads=2):
        residual, batch_size = Q, Q.size(0)

        ##下面这个就是先映射，后分头；一定要注意的是q和k分头之后维度是一致额，所以一看这里都是dk
        q_s = self.W_Q(Q).view(batch_size, -1, n_heads, d_k).transpose(1,
                                                                       2)  # q_s: [batch_size x n_heads x len_q x d_k]
        k_s = self.W_K(K).view(batch_size, -1, n_heads, d_k).transpose(1,
                                                                       2)  # k_s: [batch_size x n_heads x len_k x d_k]
        v_s = self.W_V(V).view(batch_size, -1, n_heads, d_v).transpose(1,
                                                                       2)  # v_s: [batch_size x n_heads x len_k x d_v]

        attn_mask = attn_mask.unsqueeze(1).repeat(1, n_heads, 1, 1)

        context, attn = ScaledDotProductAttention()(q_s, k_s, v_s, attn_mask)
        context = context.transpose(1, 2).contiguous().view(batch_size, -1,
                                                            n_heads * d_v)  # context: [batch_size x len_q x n_heads * d_v]
        output = self.linear(context)
        return self.layer_norm(output + residual), attn  # output: [batch_size x len_q x d_model]


## 7. ScaledDotProductAttention
class ScaledDotProductAttention(nn.Module):
    def __init__(self):
        super(ScaledDotProductAttention, self).__init__()

    def forward(self, Q, K, V, attn_mask, d_k=16):
        ## 输入进来的维度分别是 [batch_size x n_heads x len_q x d_k]  K： [batch_size x n_heads x len_k x d_k]  V: [batch_size x n_heads x len_k x d_v]
        ##首先经过matmul函数得到的scores形状是 : [batch_size x n_heads x len_q x len_k]
        scores = torch.matmul(Q, K.transpose(-1, -2)) / np.sqrt(d_k)

        ## 然后关键词地方来了，下面这个就是用到了我们之前重点讲的attn_mask，把被mask的地方置为无限小，softmax之后基本就是0，对q的单词不起作用
        scores.masked_fill_(attn_mask, -1e9)  # Fills elements of self tensor with value where mask is one.
        attn = nn.Softmax(dim=-1)(scores)
        context = torch.matmul(attn, V)
        return context, attn


## 8. PoswiseFeedForwardNet
class PoswiseFeedForwardNet(nn.Module):
    def __init__(self, d_model=128, d_ff=32):
        super(PoswiseFeedForwardNet, self).__init__()
        self.conv1 = nn.Conv1d(in_channels=d_model, out_channels=d_ff, kernel_size=1)
        self.conv2 = nn.Conv1d(in_channels=d_ff, out_channels=d_model, kernel_size=1)
        self.layer_norm = nn.LayerNorm(d_model)

    def forward(self, inputs):
        residual = inputs  # inputs : [batch_size, len_q, d_model]
        output = nn.ReLU()(self.conv1(inputs.transpose(1, 2)))
        output = self.conv2(output).transpose(1, 2)
        return self.layer_norm(output + residual)


class SupConLoss(nn.Module):

    def __init__(self, temperature=0.5, scale_by_temperature=True):
        super(SupConLoss, self).__init__()
        self.temperature = temperature
        self.scale_by_temperature = scale_by_temperature

    def forward(self, features1, features2, labels=None, mask=None):

        device = (torch.device('cuda') if features1.is_cuda else torch.device('cpu'))

        features = torch.cat((features1, features2), 0)
        features = F.normalize(features, p=2, dim=1)
        batch_size = features.shape[0]
        batch = features1.shape[0]

        # 关于labels参数
        if labels is not None and mask is not None:  # labels和mask不能同时定义值，因为如果有label，那么mask是需要根据Label得到的
            raise ValueError('Cannot define both `labels` and `mask`')
        if labels is None and mask is None:  # 如果没有labels，也没有mask，就是无监督学习，mask是对角线为1的矩阵，表示(i,i)属于同一类
            mask = torch.eye(batch, dtype=torch.float32).to(features.device)
        elif labels is not None:  # 如果给出了labels, mask根据label得到，两个样本i,j的label相等时，mask_{i,j}=1
            labels = labels.contiguous().view(-1, 1)
            if labels.shape[0] != batch_size:
                raise ValueError('Num of labels does not match num of features')
            mask = torch.eq(labels, labels.T).float().to(features.device)
        else:
            mask = mask.float().to(features.device)

        # mask = 2 * mask - torch.ones_like(mask)
        mask = torch.cat((mask, mask), 1)
        mask = torch.cat((mask, mask), 0)

        # compute logits
        anchor_dot_contrast = torch.div(
            torch.matmul(features, features.T),
            self.temperature)  # 计算两两样本间点乘相似度
        # for numerical stability
        logits_max, _ = torch.max(anchor_dot_contrast, dim=1, keepdim=True)
        logits = anchor_dot_contrast - logits_max.detach()
        # logits = anchor_dot_contrast
        exp_logits = torch.exp(logits)

        # 构建mask
        logits_mask = torch.ones_like(mask).to(exp_logits.device) - torch.eye(batch_size).to(exp_logits.device)
        positives_mask = (mask * logits_mask).to(logits_mask.device)
        negatives_mask = (1. - mask).to(logits_mask.device)

        num_positives_per_row = torch.sum(positives_mask, axis=1).to(logits_mask.device)  # 除了自己之外，正样本的个数  [2 0 2 2]
        denominator = torch.sum(exp_logits * negatives_mask, axis=1, keepdims=True) + torch.sum(
            exp_logits * positives_mask, axis=1, keepdims=True)

        log_probs = logits - torch.log(denominator)
        if torch.any(torch.isnan(log_probs)):
            raise ValueError("Log_prob has nan!")
        log_probs = torch.sum(
            log_probs * positives_mask, axis=1)[num_positives_per_row > 0] / num_positives_per_row[
                        num_positives_per_row > 0]

        # loss
        loss = -log_probs
        if self.scale_by_temperature:
            loss *= self.temperature
        loss = loss.mean()
        return loss
