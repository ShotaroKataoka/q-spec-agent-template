# Cleanup Rules

## Core Principle
**Dead code is liability, not asset**

未使用コードは保守コストを増大させる技術的負債。積極的な削除が必要。

## Cleanup Strategy

### 1. Automated Detection
自動化ツールによる網羅的な検出を優先する。

### 2. Immediate Removal
発見した未使用コードは即座に削除する。

### 3. Git History Trust
削除への躊躇は不要。Gitが履歴を保持している。

## Universal Cleanup Targets

### Code Elements
- **Unused imports** - インポートされているが使用されていないモジュール
- **Dead functions** - 呼び出されていない関数・メソッド
- **Unused variables** - 定義されているが参照されていない変数
- **Unreachable code** - 実行されることのないコードパス

### Files and Directories
- **Orphaned files** - 参照されていないファイル
- **Empty directories** - 内容のないディレクトリ
- **Backup files** - .bak, .orig, .tmp等の一時ファイル
- **Generated files** - ビルド成果物で管理対象外のもの

## Language-Agnostic Commands

### Detection Commands
```bash
# 未使用ファイル検索
find . -name "*.orig" -o -name "*.bak" -o -name "*.tmp"

# 空ディレクトリ検索
find . -type d -empty

# 大きなファイル検索（不要な可能性）
find . -type f -size +10M

# 最近変更されていないファイル
find . -type f -mtime +365

# その他、言語固有の検出ツールを活用する
```

## Cleanup Workflow

### 1. Pre-Implementation Cleanup
実装開始前に既存の未使用コードを削除

### 2. Development Cleanup
開発中に作成した一時的なコード・ファイルの削除

### 3. Post-Implementation Cleanup
実装完了後の最終清掃

## Safety Guidelines

### Before Deletion
- [ ] **Automated tool confirmation** - ツールによる未使用確認
- [ ] **Grep verification** - 文字列検索による最終確認
- [ ] **Test execution** - 削除前のテスト実行

### Deletion Process
- [ ] **Commit current state** - 削除前の状態をコミット
- [ ] **Remove unused code** - 未使用コードの削除
- [ ] **Run tests** - 削除後のテスト実行
- [ ] **Commit cleanup** - 清掃結果をコミット

### Recovery Plan
- **Git revert** - 問題があれば即座に復元
- **Selective restore** - 必要な部分のみ復元

## Cleanup Categories

### Conservative Cleanup
- 明らかに未使用のコード
- 自動生成されたファイル
- 一時ファイル・バックアップファイル

### Aggressive Cleanup
- 長期間未変更のコード
- 複雑で理解困難なコード
- 重複している機能

### Prohibited Cleanup
- テストコード（明示的指示がない限り）
- 設定ファイル
- ドキュメント
- 外部依存関係

---
**Created**: 2025-09-23
