# Project Steering Setup

## 初期化手順
1. **ディレクトリ作成**: `mkdir -p .kiro/steering`
2. **Q-SPEC Frameworkヒアリング**: プロジェクト要件の把握
3. **基本steering作成**: product.md, tech.md, structure.md
4. **プリセット選択・コピー**: 適切なsteering_seedsの選択

## steering_seeds構成

### 利用可能なseeds
```
steering_seeds/
├── design_philosophy/         # プロジェクトの設計思想・アーキテクチャパターン
│   └── clean_architecture.md      # クリーンアーキテクチャ設計思想
└── tech_stacks/               # 言語固有の開発ツール・品質基準・ベストプラクティス
    └── python.md                  # Python開発環境・ツール設定
```

ヒアリングでは、使用すべきseedsの判断ができるように質問項目を考える。
ヒアリング結果に基づき、適切なseedsを`.kiro/steering/`にコピーする。

## 基本steering作成

**Q-SPEC Framework**でヒアリングする。

### product.md作成
**目的**: プロジェクトビジョン、コア機能、ロードマップの定義

steering_templates/product.mdを参考にヒアリング結果で直接作成

### tech.md作成
**目的**: 技術スタック、アーキテクチャ決定、制約の記録

steering_templates/tech.mdを参考に技術決定を記述
選択されたsteering_seedsの内容を事前に確認し、内容の重複を避ける。

### structure.md作成
**目的**: プロジェクト構造、ディレクトリ構成、モジュール分割の定義

steering_templates/structure.mdを参考にプロジェクト構造を記述、選択された設計思想を反映

## 完了確認
- [ ] `.kiro/steering/product.md` 作成完了
- [ ] `.kiro/steering/tech.md` 作成完了  
- [ ] `.kiro/steering/structure.md` 作成完了
- [ ] 適切なsteering_seedsコピー完了
- [ ] プロジェクト固有の調整完了
