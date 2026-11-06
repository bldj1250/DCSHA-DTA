# DCSHA-DTA: Dual-Contrastive Learning of Sequence, Hierarchical Graph, and Auxiliary Features for Drug-Target Binding Affinity Prediction
---

## Requirements:
- python 3.8
- rdkit 2024.03.2
- torch 2.4.1
- torch_geometric 2.6.1
- numpy 1.20.0
- pandas 2.0.3
- networkx 2.5
- pybiomed 1.0
- tqdm 4.67.1
- openpyxl 3.1.5
---

## How to run

### DCSHA-DTA

1. Run graph_prepare.py to generate the distance map.
2. Run fp.py to generate preprocessed drug fingerprints.pkl.
3. Run train_DTA.py to train and test the model.
