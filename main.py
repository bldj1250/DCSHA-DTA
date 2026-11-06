import argparse
import random
import numpy as np
import pandas as pd
import torch
from openpyxl.workbook import Workbook
from torch import nn
from torch.utils.data import DataLoader

from model import MENDTA
from baseline_utils import _collate_regr, load_drug_dict, load_target_dict, MyDataset, train, predicting, get_mse, get_rm2, get_ci

seed = 42
torch.manual_seed(seed)
torch.cuda.manual_seed(seed)
torch.cuda.manual_seed_all(seed)
random.seed(seed)
np.random.seed(seed)
torch.backends.cudnn.deterministic = True
torch.backends.cudnn.benchmark = False

parser = argparse.ArgumentParser()
parser.add_argument('--dataset', type=str, default='davis', help='davis/bindingdb')
parser.add_argument('--batch_size', type=int, default=128,
                    help='batch size')
parser.add_argument('--lr', type=float, default=0.0005,
                    help='the learning rate')
parser.add_argument('--epochs', type=int, default=500,
                    help='the epochs for model')

args = parser.parse_args()

if torch.cuda.is_available():
    device = torch.device('cuda:0')
    print('The code uses GPU...')
else:
    device = torch.device('cpu')
    print('The code uses CPU!!!')


# 1. 直接读取已划分好的数据集
train_dta = pd.read_csv('./data/' + args.dataset +'_train.csv')
test_dta = pd.read_csv('./data/' + args.dataset +'_test.csv')
all_dta = pd.concat([train_dta, test_dta], ignore_index=True)

# 2. 构建字典（假设这两个函数可以直接处理读取后的DataFrame）
drug_dict = load_drug_dict(all_dta)   # 用全量数据构建
target_dict = load_target_dict(all_dta)  # 目标字典同理

# 3. 构建数据集对象
train_dataset = MyDataset(drug_dict, target_dict, train_dta)
test_dataset = MyDataset(drug_dict, target_dict, test_dta)

train_loader = DataLoader(train_dataset, batch_size=args.batch_size,shuffle=True, collate_fn=_collate_regr)
test_loader = DataLoader(test_dataset, batch_size=args.batch_size,shuffle=False, collate_fn=_collate_regr)

model = MENDTA().to(device)
optimizer = torch.optim.AdamW(model.parameters(), lr=args.lr, weight_decay=1e-5)
loss_fn = nn.MSELoss()
best_mse = float('inf')
patience = 200  # 连续未改善的容忍 epoch 数
no_improve = 0  # 计数器
wb = Workbook()
ws = wb.active
# 1. 写入训练集表头
ws.append(['Epoch', 'Train MSE', 'Train r_m^2'])
for epoch in range(args.epochs):
    train(model, train_loader, optimizer, loss_fn, device)
    labels, preds = predicting(model, device,  test_loader)
    mse = get_mse(labels, preds)
    rm2 = get_rm2(labels, preds)
    row = [epoch, mse.item(), rm2.item()]
    ws.append(row)
    print(f'Epoch [{epoch}] | MSE: {mse:.4f} | r_m^2: {rm2:.4f}')

    # ---------- 早停与模型保存逻辑 ----------
    if mse < best_mse:
        best_mse = mse
        torch.save(model.state_dict(), args.dataset +'.pth')
        no_improve = 0  # 有改善，重置计数器
    else:
        no_improve += 1  # 未改善，计数+1
    print(f'  No improvement for {no_improve} epochs, best mse = {best_mse:.4f}')
    if no_improve >= patience:
         print("触发早停，结束训练！")
         break
model.load_state_dict(torch.load(args.dataset +'.pth', map_location=device))
labels, preds = predicting(model, device, test_loader)
mse = float(get_mse(labels, preds))
rm2 = float(get_rm2(labels, preds))
ci = float(get_ci(labels, preds))
row = [mse, rm2, ci]
print('row=', row)
ws.append(['Test MSE', 'Test r_m^2', 'Test CI'])
ws.append(row)
wb.save(args.dataset + '.xlsx')