import os
import torch
import json, pickle
import pandas as pd
import numpy as np
from tqdm import tqdm
import networkx as nx
import torch.nn.functional as F
from PyBioMed.PyMolecule import cats2d
from PyBioMed.PyProtein.Autocorrelation import CalculateMoranAutoTotal
from PyBioMed.PyProtein.PyProtein import PyProtein
from rdkit import Chem, DataStructs
from rdkit.Chem import AllChem, MACCSkeys, BRICS, MolFromSmiles
from torch.utils.data import Dataset
from torch_geometric.data import Data, Batch
from collections import OrderedDict
from collections import defaultdict

dataset = 'davis'


def train(model, train_set, optimizer, myloss, device):
    model.train()
    for idx, data in enumerate(tqdm(train_set, desc='training', total=len(train_set))):
        drug, target, label = data

        drug = drug.to(device)
        target = target.to(device)
        label = label.to(device)

        predict, con_loss = model(drug, target, label)
        loss1 = myloss(predict.squeeze(), label)
        loss = loss1 + con_loss

        optimizer.zero_grad()
        loss.backward()
        optimizer.step()


def predicting(model, device, test_set):
    model.eval()
    total_preds = torch.Tensor()
    total_preds = total_preds.to(device)
    total_labels = torch.Tensor()
    total_labels = total_labels.to(device)
    with torch.no_grad():
        for idx, data in enumerate(tqdm(test_set, desc='testing', total=len(test_set))):
            drug, target, label = data
            drug = drug.to(device)
            target = target.to(device)
            label = label.to(device)

            predict, _ = model(drug, target, label)

            total_preds = torch.cat((total_preds, predict), 0)
            total_labels = torch.cat((total_labels, label), 0)
    total_labels = total_labels.to('cpu')
    total_preds = total_preds.to('cpu')
    total_preds = total_preds.squeeze(1)
    return total_labels, total_preds


###########################################################################################################
# 下面的 metric 函数保持不变
def rmse(y, f):
    return sqrt(((y - f) ** 2).mean(axis=0))


def get_mse(y, f):
    return ((y - f) ** 2).mean(axis=0)


def pearson(y, f):
    return np.corrcoef(y, f)[0, 1]


def spearman(y, f):
    return stats.spearmanr(y, f)[0]


def get_ci(y, f):
    ind = np.argsort(y)
    y = y[ind];
    f = f[ind]
    i = len(y) - 1;
    j = i - 1
    z = 0.0;
    S = 0.0
    while i > 0:
        while j >= 0:
            if y[i] > y[j]:
                z += 1
                u = f[i] - f[j]
                if u > 0:
                    S += 1
                elif u == 0:
                    S += 0.5
            j -= 1
        i -= 1;
        j = i - 1
    return S / z


def r_squared_error(y_obs, y_pred):
    y_obs = np.array(y_obs);
    y_pred = np.array(y_pred)
    y_obs_mean = np.mean(y_obs);
    y_pred_mean = np.mean(y_pred)
    mult = sum((y_pred - y_pred_mean) * (y_obs - y_obs_mean)) ** 2
    y_obs_sq = sum((y_obs - y_obs_mean) ** 2)
    y_pred_sq = sum((y_pred - y_pred_mean) ** 2)
    return mult / float(y_obs_sq * y_pred_sq)


def get_k(y_obs, y_pred):
    y_obs = np.array(y_obs);
    y_pred = np.array(y_pred)
    return sum(y_obs * y_pred) / float(sum(y_pred * y_pred))


def squared_error_zero(y_obs, y_pred):
    k = get_k(y_obs, y_pred)
    y_obs = np.array(y_obs);
    y_pred = np.array(y_pred)
    y_obs_mean = np.mean(y_obs)
    upp = sum((y_obs - (k * y_pred)) ** 2)
    down = sum((y_obs - y_obs_mean) ** 2)
    return 1 - (upp / float(down))


def get_rm2(ys_orig, ys_line):
    r2 = r_squared_error(ys_orig, ys_line)
    r02 = squared_error_zero(ys_orig, ys_line)
    return r2 * (1 - np.sqrt(np.absolute((r2 * r2) - (r02 * r02))))


###########################################################################################################
class MyDataset(Dataset):
    def __init__(self, drug_dict, target_dict, res):
        super(MyDataset, self).__init__()
        self.drug, self.target = drug_dict, target_dict
        res.reset_index(drop=True, inplace=True)
        self.drug_name = res['compound_id']
        self.target_name = res['target_name']
        self.value = res['affinity']

    def __len__(self):
        return len(self.value)

    def __getitem__(self, index):
        pubchem = str(self.drug_name[index])
        depmap = self.target_name[index]
        return self.drug[pubchem], self.target[depmap], self.value[index]


def _collate_regr(samples):
    drugs, targets, labels = zip(*samples)

    d_f1 = torch.stack([d['f1'] for d in drugs])
    d_f2_list = [d['f2'] for d in drugs]
    d_f2_batch = Batch.from_data_list(d_f2_list)
    d_f3 = torch.stack([d['f3'] for d in drugs])
    d_f4 = torch.stack([d['f4'] for d in drugs])

    f1 = torch.stack([c['f1'] for c in targets])
    f2_list = [c['f2'] for c in targets]
    f2_batch = Batch.from_data_list(f2_list)
    f3 = torch.stack([c['f3'] for c in targets])

    batched_drug = Data(
        f1=d_f1,
        f2=d_f2_batch,
        f3=d_f3,
        f4=d_f4,
    )
    batched_target = Data(
        f1=f1,
        f2=f2_batch,
        f3=f3,
    )

    labels = torch.tensor(labels, dtype=torch.float32)
    return batched_drug, batched_target, labels


###########################################################################################################

def load_drug_dict(response):
    pubchem_to_smiles = dict(zip(response['compound_id'].apply(lambda x: str(x)), response['compound_smiles']))
    #pubchem_to_smiles = dict(zip(response['compound_id'].apply(lambda x: str(int(float(x)))), response['compound_smiles']))

    # 加载指纹缓存
    fp_cache_file = './dataset/' + dataset + '_fingerprints_cache.pkl'
    with open(fp_cache_file, 'rb') as f:
        fp_cache = pickle.load(f)

    drug_dict = {}
    for pubchem, smiles in pubchem_to_smiles.items():
        sequence = smiles2sequence(smiles)
        sequence = torch.tensor(sequence, dtype=torch.int64)

        atom_size, mol_size, mol_features, mol_edge_index = smile_to_graph(smiles)
        graph = Data(x=torch.tensor(np.array(mol_features), dtype=torch.float32),
                     edge_index=torch.LongTensor(np.array(mol_edge_index)).transpose(1, 0),
                     atom_size=atom_size,
                     mol_size=mol_size
                     )

        if pubchem in fp_cache:
            fp = fp_cache[pubchem]
        else:
            fp = calculate_molecular_fingerprints(smiles)

        physicochemical_descriptors = extract_rdkit(smiles)
        drug_dict[pubchem] = {
            'f1': sequence,
            'f2': graph,
            'f3': torch.FloatTensor(physicochemical_descriptors),
            'f4': fp,
        }
    return drug_dict


def load_target_dict(response):
    contac_path = './data/' + dataset + '/distance_map'
    targets = list(set(response['target_name']))
    target2sequence = response.set_index('target_name')['target_sequence'].to_dict()
    target_dict = {}
    for target in targets:
        sequence = target2sequence[target]
        x_sequence = label_sequence(sequence)
        x_sequence = torch.tensor(x_sequence, dtype=torch.int64)

        residue_size, target_size, target_feature, target_edge_index = target_to_graph(target,sequence,contac_path,dataset)
        graph = Data(x=torch.tensor(np.array(target_feature), dtype=torch.float32),
                     edge_index=torch.LongTensor(np.array(target_edge_index)).transpose(1, 0),
                     residue_size=residue_size,
                     target_size=target_size
                     )
        prot2text = target_to_prot2text(target)
        target_dict[target] = {
            'f1': x_sequence,
            'f2': graph,
            'f3': prot2text,
        }
    return target_dict


def target_to_prot2text(target):
    save_dir = f"./dataset/{dataset}_target_biobert"
    feature_path = os.path.join(save_dir, f"{target}.npz")

    feat = np.load(feature_path)['biobert'].astype(np.float32)
    feature = torch.from_numpy(feat)

    max_len = 500
    seq_len = feature.shape[0]
    feat_dim = feature.shape[1]

    if seq_len > max_len:
        # 超过 500，保留最后 max_len 个位置（可按需改为前 500 个）
        out = feature[:max_len, :]
    else:
        # 不足 500，在序列末尾补零
        pad_len = max_len - seq_len
        padding = torch.zeros(pad_len, feat_dim)
        out = torch.cat([feature, padding], dim=0)

    return out  # shape: (500, 768)



from rdkit.Chem import rdFingerprintGenerator

def calculate_molecular_fingerprints(smile):
    mol = Chem.MolFromSmiles(smile)
    if mol is None:
        raise ValueError(f"无法解析 SMILES: {smile}")
    # MACCS Keys 指纹 (167维)
    maccs_fp = AllChem.GetMACCSKeysFingerprint(mol)
    maccs_array = np.array(maccs_fp, dtype=np.float32)

    # ErG (Extended Reduced Graph) 指纹 (441维)
    erg_fp = AllChem.GetErGFingerprint(mol, fuzzIncrement=0.3, maxPath=21, minPath=1)
    erg_array = np.array(erg_fp, dtype=np.float32)

    # ECFP4 (Morgan) 指纹 (1024维)
    ecfp_fp = AllChem.GetMorganFingerprintAsBitVect(mol, radius=2, nBits=1024)
    ecfp_array = np.array(ecfp_fp, dtype=np.float32)

    # 合并指纹
    fp = torch.tensor(np.concatenate([maccs_array, erg_array, ecfp_array]))

    return fp  # [1632,]



from rdkit.Chem import Descriptors, Crippen, Lipinski, AllChem, DataStructs


# =========================
#  RDKit feature extractor
# =========================
def safe(x):
    try:
        if x is None:
            return 0.0
        return float(x)
    except:
        return 0.0


def extract_rdkit(smiles):
    mol = Chem.MolFromSmiles(smiles)
    if mol is None:
        return np.zeros(18, dtype=np.float32)

    # ---- physicochemical (10)
    phys = np.array([
        safe(Descriptors.MolWt(mol)),
        safe(Crippen.MolLogP(mol)),
        safe(Descriptors.TPSA(mol)),
        safe(Lipinski.NumHDonors(mol)),
        safe(Lipinski.NumHAcceptors(mol)),
        safe(Lipinski.NumRotatableBonds(mol)),
        safe(Descriptors.RingCount(mol)),
        safe(Descriptors.NumAromaticRings(mol)),
        safe(Descriptors.FractionCSP3(mol)),
        safe(Descriptors.qed(mol))
    ], dtype=np.float32)

    # ---- topology (7)
    topo = np.array([
        safe(Descriptors.HeavyAtomCount(mol)),
        safe(Descriptors.RingCount(mol)),
        safe(Descriptors.NumAromaticRings(mol)),
        safe(Descriptors.NumAliphaticRings(mol)),
        safe(Descriptors.NumSaturatedRings(mol)),
        safe(Descriptors.FractionCSP3(mol)),
        safe(Descriptors.BertzCT(mol))
    ], dtype=np.float32)

    # =========================
    # 3D feature (robust)
    # =========================
    try:
        mol3d = Chem.AddHs(mol)

        ok = AllChem.EmbedMolecule(mol3d, randomSeed=42)
        if ok != 0:
            raise ValueError("Embed failed")

        AllChem.UFFOptimizeMolecule(mol3d)

        conf = mol3d.GetConformer()
        coords = conf.GetPositions()

        centroid = coords.mean(axis=0)
        rg = np.sqrt(((coords - centroid) ** 2).sum(axis=1).mean())

    except:
        rg = 0.0

    rg = np.array([rg], dtype=np.float32)  # ✔ FIX: 1D !!!

    feat = np.concatenate([phys, topo, rg])

    return feat



def smiles2sequence(line, MAX_SMI_LEN=100):
    CHARISOSMISET = {"#": 29, "%": 30, ")": 31, "(": 1, "+": 32, "-": 33, "/": 34, ".": 2,
                     "1": 35, "0": 3, "3": 36, "2": 4, "5": 37, "4": 5, "7": 38, "6": 6,
                     "9": 39, "8": 7, "=": 40, "A": 41, "@": 8, "C": 42, "B": 9, "E": 43,
                     "D": 10, "G": 44, "F": 11, "I": 45, "H": 12, "K": 46, "M": 47, "L": 13,
                     "O": 48, "N": 14, "P": 15, "S": 49, "R": 16, "U": 50, "T": 17, "W": 51,
                     "V": 18, "Y": 52, "[": 53, "Z": 19, "]": 54, "\\": 20, "a": 55, "c": 56,
                     "b": 21, "e": 57, "d": 22, "g": 58, "f": 23, "i": 59, "h": 24, "m": 60,
                     "l": 25, "o": 61, "n": 26, "s": 62, "r": 27, "u": 63, "t": 28, "y": 64}
    X = np.zeros(MAX_SMI_LEN)
    for i, ch in enumerate(line[:MAX_SMI_LEN]):  # x, smi_ch_ind, y
        X[i] = CHARISOSMISET[ch]

    return X


def label_sequence(line, MAX_SEQ_LEN=850):
    CHARPROTSET = {"A": 1, "C": 2, "B": 3, "E": 4, "D": 5, "G": 6,
                   "F": 7, "I": 8, "H": 9, "K": 10, "M": 11, "L": 12,
                   "O": 13, "N": 14, "Q": 15, "P": 16, "S": 17, "R": 18,
                   "U": 19, "T": 20, "W": 21,
                   "V": 22, "Y": 23, "X": 24,
                   "Z": 25}

    X = np.zeros(MAX_SEQ_LEN)

    for i, ch in enumerate(line[:MAX_SEQ_LEN]):
        X[i] = CHARPROTSET[ch]

    return X


###########################################################################################################

def atom_features(atom):
    # 44 +11 +11 +11 +1
    return np.array(one_of_k_encoding_unk(atom.GetSymbol(),
                                          ['C', 'N', 'O', 'S', 'F', 'Si', 'P', 'Cl', 'Br', 'Mg', 'Na', 'Ca', 'Fe', 'As',
                                           'Al', 'I', 'B', 'V', 'K', 'Tl', 'Yb', 'Sb', 'Sn', 'Ag', 'Pd', 'Co', 'Se',
                                           'Ti', 'Zn', 'H', 'Li', 'Ge', 'Cu', 'Au', 'Ni', 'Cd', 'In', 'Mn', 'Zr', 'Cr',
                                           'Pt', 'Hg', 'Pb', 'X']) +
                    one_of_k_encoding(atom.GetDegree(), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) +
                    one_of_k_encoding_unk(atom.GetTotalNumHs(), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) +
                    one_of_k_encoding_unk(atom.GetImplicitValence(), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) +
                    [atom.GetIsAromatic()])


def one_of_k_encoding(x, allowable_set):
    if x not in allowable_set:
        raise Exception("input {0} not in allowable set{1}:".format(x, allowable_set))
    return list(map(lambda s: x == s, allowable_set))


def one_of_k_encoding_unk(x, allowable_set):
    """Maps inputs not in the allowable set to the last element."""
    if x not in allowable_set:
        x = allowable_set[-1]
    return list(map(lambda s: x == s, allowable_set))


def get_cliques_link(breaks, cliques):
    clique_id_of_node = {}
    for idx, clique in enumerate(cliques):
        for c in clique:
            clique_id_of_node[c] = idx
    breaks_bond = {}
    for bond in breaks:
        breaks_bond[f'{bond[0]}_{bond[1]}'] = [clique_id_of_node[bond[0]], clique_id_of_node[bond[1]]]
    return breaks_bond


def motif_decomp(mol):
    n_atoms = mol.GetNumAtoms()
    if n_atoms == 1:
        return [], []

    cliques = []
    breaks = []
    for bond in mol.GetBonds():
        a1 = bond.GetBeginAtom().GetIdx()
        a2 = bond.GetEndAtom().GetIdx()
        cliques.append([a1, a2])

    res = list(BRICS.FindBRICSBonds(mol))
    if len(res) != 0:
        for bond in res:
            if [bond[0][0], bond[0][1]] in cliques:
                cliques.remove([bond[0][0], bond[0][1]])
            else:
                cliques.remove([bond[0][1], bond[0][0]])
            cliques.append([bond[0][0]])
            cliques.append([bond[0][1]])
            breaks.append([bond[0][0], bond[0][1]])

    # merge cliques
    for c in range(len(cliques) - 1):
        if c >= len(cliques):
            break
        for k in range(c + 1, len(cliques)):
            if k >= len(cliques):
                break
            if len(set(cliques[c]) & set(cliques[k])) > 0:
                cliques[c] = list(set(cliques[c]) | set(cliques[k]))
                cliques[k] = []
        cliques = [c for c in cliques if len(c) > 0]
    cliques = [c for c in cliques if n_atoms > len(c) > 0]

    breaks = get_cliques_link(breaks, cliques)
    return breaks, cliques


def smile_to_graph(smile):
    # 1. Molecule
    mol = Chem.MolFromSmiles(smile)
    if mol is None:
        raise ValueError(f"Invalid SMILES: {smile}")
    atom_size = mol.GetNumAtoms()
    # 获取基础原子特征
    base_atom_features = [atom_features(atom)for atom in mol.GetAtoms()]
    atom_feature = []
    for feat in base_atom_features:
        atom_feature.append(np.concatenate((feat, np.array([0, 1]))))

    # 2. BRICS Motif Decomposition
    breaks, cliques = motif_decomp(mol)
    # 无法切割时
    if len(cliques) == 0:
        cliques = [list(range(atom_size))]
        breaks = {}
    # 去掉单原子motif（推荐）
    cliques = [c for c in cliques if len(c) > 1]
    if len(cliques) == 0:
        cliques = [list(range(atom_size))]
        breaks = {}
    substruct_size = len(cliques)

    # 3. Motif Features
    substruct_features = []
    for clique in cliques:
        # 计算Motif内原子的平均特征
        feat_mean = np.zeros((base_atom_features[0].shape[0],))  # 获取基础维度
        feat_with_flag = np.concatenate((feat_mean, np.array([1, 0])))
        substruct_features.append(feat_with_flag)

    # 4. 构建超级节点特征：全零占位符 + 11
    super_base = np.zeros((base_atom_features[0].shape[0],))  # 获取基础维度
    super_node_feature = np.concatenate((super_base, np.array([1, 1])))

    # 5. All Features  合并所有特征：原子 + Motif + 超级节点
    total_size = atom_size + substruct_size + 1
    all_features = atom_feature + substruct_features + [super_node_feature]

    # 6. Atom-Level Edges (双向边 + 自环)
    atom_edges = []
    for bond in mol.GetBonds():
        u = bond.GetBeginAtomIdx()
        v = bond.GetEndAtomIdx()
        atom_edges.append([u, v])
        atom_edges.append([v, u])
    # self-loop
    for i in range(atom_size):
        atom_edges.append([i, i])

    # 7. Atom -> Motif Edges (单向边)
    cross_edges = []
    atom_to_motif = defaultdict(list)
    for motif_id, clique in enumerate(cliques):
        global_motif_id = atom_size + motif_id
        for atom_idx in clique:
            atom_to_motif[atom_idx].append(global_motif_id)
    for atom_idx, motif_ids in atom_to_motif.items():
        for motif_id in motif_ids:
            cross_edges.append([atom_idx, motif_id])

    # 8. Motif -> Supernode Edges (单向边)
    super_node_idx = atom_size + substruct_size  # 超级节点的索引
    motif_to_super_edges = []

    # 构建 motif -> 超级节点 的单向边
    for motif_id in range(substruct_size):
        global_motif_id = atom_size + motif_id
        motif_to_super_edges.append([global_motif_id, super_node_idx])

    # 9. Fused Graph
    fused_edge_index = atom_edges + cross_edges + motif_to_super_edges

    return atom_size, total_size, all_features, fused_edge_index

    ###########################################################################################################


def dic_normalize(dic):
    # print(dic)
    max_value = dic[max(dic, key=dic.get)]
    min_value = dic[min(dic, key=dic.get)]
    # print(max_value)
    interval = float(max_value) - float(min_value)
    for key in dic.keys():
        dic[key] = (dic[key] - min_value) / interval
    dic['X'] = (max_value + min_value) / 2.0
    return dic


pro_res_table = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y',
                 'X']

pro_res_aliphatic_table = ['A', 'I', 'L', 'M', 'V']
pro_res_aromatic_table = ['F', 'W', 'Y']
pro_res_polar_neutral_table = ['C', 'N', 'Q', 'S', 'T']
pro_res_acidic_charged_table = ['D', 'E']
pro_res_basic_charged_table = ['H', 'K', 'R']

res_weight_table = {'A': 71.08, 'C': 103.15, 'D': 115.09, 'E': 129.12, 'F': 147.18, 'G': 57.05, 'H': 137.14,
                    'I': 113.16, 'K': 128.18, 'L': 113.16, 'M': 131.20, 'N': 114.11, 'P': 97.12, 'Q': 128.13,
                    'R': 156.19, 'S': 87.08, 'T': 101.11, 'V': 99.13, 'W': 186.22, 'Y': 163.18}
res_weight_table['X'] = np.average([res_weight_table[k] for k in res_weight_table.keys()])

res_pka_table = {'A': 2.34, 'C': 1.96, 'D': 1.88, 'E': 2.19, 'F': 1.83, 'G': 2.34, 'H': 1.82, 'I': 2.36,
                 'K': 2.18, 'L': 2.36, 'M': 2.28, 'N': 2.02, 'P': 1.99, 'Q': 2.17, 'R': 2.17, 'S': 2.21,
                 'T': 2.09, 'V': 2.32, 'W': 2.83, 'Y': 2.32}
res_pka_table['X'] = np.average([res_pka_table[k] for k in res_pka_table.keys()])

res_pkb_table = {'A': 9.69, 'C': 10.28, 'D': 9.60, 'E': 9.67, 'F': 9.13, 'G': 9.60, 'H': 9.17,
                 'I': 9.60, 'K': 8.95, 'L': 9.60, 'M': 9.21, 'N': 8.80, 'P': 10.60, 'Q': 9.13,
                 'R': 9.04, 'S': 9.15, 'T': 9.10, 'V': 9.62, 'W': 9.39, 'Y': 9.62}
res_pkb_table['X'] = np.average([res_pkb_table[k] for k in res_pkb_table.keys()])

res_pkx_table = {'A': 0.00, 'C': 8.18, 'D': 3.65, 'E': 4.25, 'F': 0.00, 'G': 0, 'H': 6.00,
                 'I': 0.00, 'K': 10.53, 'L': 0.00, 'M': 0.00, 'N': 0.00, 'P': 0.00, 'Q': 0.00,
                 'R': 12.48, 'S': 0.00, 'T': 0.00, 'V': 0.00, 'W': 0.00, 'Y': 0.00}
res_pkx_table['X'] = np.average([res_pkx_table[k] for k in res_pkx_table.keys()])

res_pl_table = {'A': 6.00, 'C': 5.07, 'D': 2.77, 'E': 3.22, 'F': 5.48, 'G': 5.97, 'H': 7.59,
                'I': 6.02, 'K': 9.74, 'L': 5.98, 'M': 5.74, 'N': 5.41, 'P': 6.30, 'Q': 5.65,
                'R': 10.76, 'S': 5.68, 'T': 5.60, 'V': 5.96, 'W': 5.89, 'Y': 5.96}
res_pl_table['X'] = np.average([res_pl_table[k] for k in res_pl_table.keys()])

res_hydrophobic_ph2_table = {'A': 47, 'C': 52, 'D': -18, 'E': 8, 'F': 92, 'G': 0, 'H': -42, 'I': 100,
                             'K': -37, 'L': 100, 'M': 74, 'N': -41, 'P': -46, 'Q': -18, 'R': -26, 'S': -7,
                             'T': 13, 'V': 79, 'W': 84, 'Y': 49}
res_hydrophobic_ph2_table['X'] = np.average([res_hydrophobic_ph2_table[k] for k in res_hydrophobic_ph2_table.keys()])

res_hydrophobic_ph7_table = {'A': 41, 'C': 49, 'D': -55, 'E': -31, 'F': 100, 'G': 0, 'H': 8, 'I': 99,
                             'K': -23, 'L': 97, 'M': 74, 'N': -28, 'P': -46, 'Q': -10, 'R': -14, 'S': -5,
                             'T': 13, 'V': 76, 'W': 97, 'Y': 63}
res_hydrophobic_ph7_table['X'] = np.average([res_hydrophobic_ph7_table[k] for k in res_hydrophobic_ph7_table.keys()])

# nomarlize the residue feature
res_weight_table = dic_normalize(res_weight_table)
res_pka_table = dic_normalize(res_pka_table)
res_pkb_table = dic_normalize(res_pkb_table)
res_pkx_table = dic_normalize(res_pkx_table)
res_pl_table = dic_normalize(res_pl_table)
res_hydrophobic_ph2_table = dic_normalize(res_hydrophobic_ph2_table)
res_hydrophobic_ph7_table = dic_normalize(res_hydrophobic_ph7_table)


# one ont encoding
def one_hot_encoding(x, allowable_set):
    if x not in allowable_set:
        # print(x)
        raise Exception('input {0} not in allowable set{1}:'.format(x, allowable_set))
    return list(map(lambda s: x == s, allowable_set))


# one ont encoding with unknown symbol
def one_hot_encoding_unk(x, allowable_set):
    if x not in allowable_set:
        x = allowable_set[-1]
    return list(map(lambda s: x == s, allowable_set))


def seq_feature(seq):
    residue_feature = []
    for residue in seq:
        # replace some rare residue with 'X'
        if residue not in pro_res_table:
            residue = 'X'
        res_property1 = [1 if residue in pro_res_aliphatic_table else 0, 1 if residue in pro_res_aromatic_table else 0,
                         1 if residue in pro_res_polar_neutral_table else 0,
                         1 if residue in pro_res_acidic_charged_table else 0,
                         1 if residue in pro_res_basic_charged_table else 0]
        res_property2 = [res_weight_table[residue], res_pka_table[residue], res_pkb_table[residue],
                         res_pkx_table[residue],
                         res_pl_table[residue], res_hydrophobic_ph2_table[residue], res_hydrophobic_ph7_table[residue]]
        residue_feature.append(res_property1 + res_property2)

    pro_hot = np.zeros((len(seq), len(pro_res_table)))
    pro_property = np.zeros((len(seq), 12))
    for i in range(len(seq)):
        # if 'X' in pro_seq:
        #     print(pro_seq)
        pro_hot[i,] = one_hot_encoding_unk(seq[i], pro_res_table)
        pro_property[i,] = residue_feature[i]

    seq_feature = np.concatenate((pro_hot, pro_property), axis=1)
    return seq_feature



def target_to_graph(target_key, target_sequence, contact_dir, dataset):
    """
    将蛋白质靶点转化为图结构数据。
    包含：残基节点、口袋节点、超级节点
    包含：残基间双向边、残基-口袋单向边、口袋-超级节点单向边
    特征扩展：残基末尾加01，口袋加10，超级节点加11
    """
    residue_size = len(target_sequence)
    current_node_count = residue_size  # 当前总节点数（初始为残基数）

    # 1. 构建残基间的边 (基于接触图 Contact Map)
    contact_file = os.path.join(contact_dir, target_key + '.numpy.npy')
    contact_map = np.load(contact_file)
    # 添加自环，确保每个节点至少与自己相连
    contact_map += np.matrix(np.eye(contact_map.shape[0]))
    index_row, index_col = np.where(contact_map >= 0.5)
    # 使用列表推导式构建边索引。
    # 因为接触图是对称的，这里直接保留 [i, j] 和 [j, i]，天然形成双向边
    target_edge_index = [[i, j] for i, j in zip(index_row, index_col)]

    # 2. 获取初始节点特征并扩展 (残基节点 +01)
    # 假设 target_to_feature 返回的是 (N, D) 的 numpy 数组
    base_features = seq_feature(target_sequence)
    #base_features = target_to_feature(target_key, target_sequence, aln_dir)
    # 创建形状为 (N, 2) 的标识符矩阵，每一行都是 [0, 1]
    residue_type_flag = np.tile(np.array([0, 1]), (base_features.shape[0], 1))
    # 拼接得到新的残基特征
    target_feature = np.hstack((base_features, residue_type_flag))

    # is_stub 标记：0 代表残基
    is_stub = np.zeros(target_feature.shape[0])

    # 3. 处理口袋节点 (Pocket Nodes) 及其与残基的边
    pocket_file_path = os.path.join('./data', dataset, 'pocket', f'predict_{target_key}', f'{target_key}.pdb_predictions.csv')
    if not os.path.exists(pocket_file_path):
        print(f"警告：靶点 {target_key} 的口袋文件不存在，跳过该靶点。")
        return residue_size, current_node_count, target_feature, target_edge_index

    df = pd.read_csv(pocket_file_path, sep=',', engine='python')
    df.columns = df.columns.str.strip()

    # 预分配列表用于高效收集边，避免在循环中频繁 np.concatenate
    pocket_edges_list = []
    valid_pocket_node_indices = []  # 用于记录有效口袋节点的索引

    # 遍历每一行（每个口袋）
    for idx, row in df.iterrows():
        # 从 residue_ids 列解析残基编号
        residue_str = str(row["residue_ids"]) if pd.notna(row["residue_ids"]) else ""
        if residue_str.strip() == "":
            continue  # 跳过空行

        # 提取纯数字编号（假设格式为 链_数字，如 "A_126 A_127 ..."）
        p_pos = []
        for item in residue_str.split():
            try:
                # 如果格式是 "A_126"，提取数字部分
                if '_' in item:
                    num = int(item.split('_')[1])
                else:
                    # 如果是纯数字，直接转换
                    num = int(item)
                p_pos.append(num)
            except (IndexError, ValueError):
                # 格式不符则忽略
                continue

        if not p_pos:
            continue  # 没有有效残基则跳过

        # 3.1 为当前口袋添加一个节点特征 (口袋节点 +10)
        pocket_type_flag = np.array([[1, 0]])  # 注意这里加了双重括号
        stub_base = np.zeros((1, target_feature.shape[1] - 2))  # 基础占位符
        stub_feature = np.hstack((stub_base, pocket_type_flag))

        target_feature = np.concatenate((target_feature, stub_feature), axis=0)
        is_stub = np.concatenate((is_stub, [1]), axis=0)  # 1 代表口袋

        # 3.2 收集该口袋与残基之间的边 (单向边：残基 -> 口袋)
        pocket_node_idx = current_node_count  # 当前口袋节点的索引

        # 过滤掉越界的残基下标
        valid_p_pos = []
        for pos in p_pos:
            if 0 <= pos < residue_size:
                valid_p_pos.append(pos)

        # 如果该口袋有合法的残基连接，则添加单向边；否则回滚该口袋节点
        if valid_p_pos:
            for pos in valid_p_pos:
                # 【核心修改】仅添加 [残基, 口袋] 单向边，不添加反向边
                pocket_edges_list.append([pos, pocket_node_idx])
            valid_pocket_node_indices.append(pocket_node_idx)  # 记录这个有效的口袋节点
            current_node_count += 1
        else:
            # 如果该口袋没有任何合法残基连接，回滚刚才添加的节点特征
            target_feature = target_feature[:-1]
            is_stub = is_stub[:-1]

    # 4. 合并残基边和口袋-残基边
    if pocket_edges_list:
        pocket_edges_array = np.array(pocket_edges_list)
        if target_edge_index:
            target_edge_index = np.concatenate((np.array(target_edge_index), pocket_edges_array), axis=0)
        else:
            target_edge_index = pocket_edges_array
    elif target_edge_index:
        target_edge_index = np.array(target_edge_index)
    else:
        target_edge_index = np.array([]).reshape(0, 2)

    # 5. 构建超级节点 (Super Node) 及 口袋-超级节点边
    # 5.1 添加超级节点的特征 (超级节点 +11)
    super_type_flag = np.array([[1, 1]])  # 注意这里加了双重括号
    super_base = np.zeros((1, target_feature.shape[1] - 2))
    super_node_feature = np.hstack((super_base, super_type_flag))

    target_feature = np.concatenate((target_feature, super_node_feature), axis=0)
    is_stub = np.concatenate((is_stub, [2]), axis=0)  # 2 代表超级节点

    super_node_idx = current_node_count  # 超级节点的索引
    current_node_count += 1  # 总节点数 +1

    # 5.2 将所有有效口袋节点连接到超级节点 (单向边：口袋 -> 超级节点)
    super_edges_list = []
    for pocket_idx in valid_pocket_node_indices:
        # 【核心修改】仅添加 [口袋, 超级节点] 单向边
        super_edges_list.append([pocket_idx, super_node_idx])

    if super_edges_list:
        super_edges_array = np.array(super_edges_list)
        target_edge_index = np.concatenate((target_edge_index, super_edges_array), axis=0)

    # 6. 最终转换为 Tensor
    target_edge_index = torch.LongTensor(target_edge_index)

    # 返回：原始残基数, 最终总节点数, 节点特征, 边索引
    return residue_size, current_node_count, target_feature, target_edge_index