# preprocess_fingerprints.py
import pickle
import pandas as pd
import numpy as np
import torch
from tqdm import tqdm
import os
from rdkit import Chem
from rdkit.Chem import AllChem


def calculate_molecular_fingerprints(smile):
    """计算分子指纹（与您的原始函数保持一致）"""
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


def preprocess_fingerprints(data_path, save_path, dataset_name=None):
    """
    预处理所有药物的指纹并保存

    Args:
        data_path: 数据文件夹路径，例如 '../data/'
        save_path: 保存指纹缓存的文件路径，例如 '../data/fingerprints_cache.pkl'
        dataset_name: 数据集名称，如果指定则读取 {dataset_name}_train.csv 和 {dataset_name}_test.csv
    """
    print("=" * 60)
    print("Starting fingerprint preprocessing...")
    print("=" * 60)


    train_file = os.path.join(data_path, f'{dataset_name}_train.csv')
    test_file = os.path.join(data_path, f'{dataset_name}_test.csv')
    train_dta = pd.read_csv(train_file)
    test_dta = pd.read_csv(test_file)
    all_dta = pd.concat([train_dta, test_dta], ignore_index=True)

    print(f"Reading data from:")
    print(f"  - {train_file}")
    print(f"  - {test_file}")
    print(f"Total molecules: {len(all_dta)}")

    # 构建 pubchem -> smiles 映射
    # 处理 compound_id 为字符串格式
    all_dta['compound_id'] = all_dta['compound_id'].apply(lambda x: str(int(float(x))))
    pubchem_to_smiles = dict(zip(
        all_dta['compound_id'],
        all_dta['compound_smiles']
    ))

    print(f"Unique molecules: {len(pubchem_to_smiles)}")
    print("-" * 60)

    # 计算指纹
    fp_cache = {}
    failed_count = 0

    for pubchem, smiles in tqdm(pubchem_to_smiles.items(), desc="Computing fingerprints"):
        try:
            fp = calculate_molecular_fingerprints(smiles)
            fp_cache[pubchem] = fp
        except Exception as e:
            print(f"Warning: Failed to compute fingerprint for {pubchem} ({smiles}): {e}")
            # 使用零向量作为fallback
            fp_cache[pubchem] = torch.zeros(1632, dtype=torch.float32)
            failed_count += 1

    # 保存指纹缓存
    os.makedirs(os.path.dirname(os.path.abspath(save_path)), exist_ok=True)
    with open(save_path, 'wb') as f:
        pickle.dump(fp_cache, f)

    print("-" * 60)
    print(f"✅ Preprocessing completed!")
    print(f"   - Total molecules processed: {len(fp_cache)}")
    print(f"   - Failed: {failed_count}")
    print(f"   - Cache saved to: {save_path}")
    print(f"   - Cache size: {os.path.getsize(save_path) / 1024 / 1024:.2f} MB")
    print("=" * 60)

    return fp_cache


def load_fingerprints(cache_path):
    if not os.path.exists(cache_path):
        raise FileNotFoundError(f"Fingerprint cache not found: {cache_path}")

    print(f"Loading fingerprint cache from: {cache_path}")
    with open(cache_path, 'rb') as f:
        fp_cache = pickle.load(f)

    print(f"Loaded {len(fp_cache)} fingerprints")
    return fp_cache


def verify_fingerprints(cache_path, sample_size=5):
    """
    验证指纹缓存是否正确
    """
    fp_cache = load_fingerprints(cache_path)

    print("\n" + "=" * 60)
    print("Verifying fingerprints...")
    print("=" * 60)

    # 显示前几个样本的信息
    import random
    sample_keys = random.sample(list(fp_cache.keys()), min(sample_size, len(fp_cache)))

    for key in sample_keys:
        fp = fp_cache[key]
        print(f"\nPubChem ID: {key}")
        print(f"  - Shape: {fp.shape}")
        print(f"  - Dtype: {fp.dtype}")
        print(f"  - Mean: {fp.mean().item():.4f}")
        print(f"  - Std: {fp.std().item():.4f}")
        print(f"  - Min: {fp.min().item():.4f}")
        print(f"  - Max: {fp.max().item():.4f}")
        print(f"  - Non-zero: {(fp > 0).sum().item()} / {fp.numel()}")

    print("\n" + "=" * 60)
    print("✅ Verification completed!")
    print("=" * 60)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Preprocess molecular fingerprints")
    parser.add_argument('--data_path', type=str, default='./data/',
                        help='Path to data directory')
    parser.add_argument('--save_path', type=str, default='./dataset/bindingdb_fingerprints_cache.pkl',
                        help='Path to save fingerprint cache')
    parser.add_argument('--dataset', type=str, default='bindingdb',
                        help='Dataset name (e.g., bindingdb, davis)')
    parser.add_argument('--verify', action='store_true',
                        help='Verify the fingerprints after preprocessing')
    parser.add_argument('--load_only', action='store_true',
                        help='Only load and verify existing cache, do not preprocess')

    args = parser.parse_args()

    if args.load_only:
        # 只加载和验证现有缓存
        verify_fingerprints(args.save_path)
    else:
        # 预处理指纹
        fp_cache = preprocess_fingerprints(
            data_path=args.data_path,
            save_path=args.save_path,
            dataset_name=args.dataset
        )

        # 验证
        if args.verify:
            verify_fingerprints(args.save_path)