# AIDLC Agent

**AI Development Life Cycle (AIDLC)** - AIエージェント時代の新しい開発ライフサイクル理論とカスタムエージェント

## 🎯 概要

AIDLCは、AIエージェントの特性を活かした革新的な開発手法です。従来の人間中心の開発プロセスから、AIエージェントとの協調を前提とした効率的な開発体制に変革します。

### 核となる理論

- **有機的組織構造**: Cell/Unit/Repository による動的な開発体制
- **SPEC駆動開発**: 全作業をSPECで管理する開発プロセス
- **SPEC-Q Framework**: AIエージェント向け効率的要求ヒアリング手法

## 🚀 クイックスタート

### 1. リポジトリのクローン

```bash
git clone https://github.com/your-username/aidlc-agent.git
cd aidlc-agent
```

### 2. セットアップ実行

```bash
./setup.sh
```

セットアップスクリプトが以下を自動実行します：
- カスタムエージェント設定の生成
- `~/.aws/amazonq/cli-agents/`への配置
- シェルエイリアスの設定（オプション）

### 3. エージェント起動

```bash
q chat --agent dev-agent
# または設定したエイリアス（例: qcd）
```

## 📋 主な機能

### SPEC駆動開発ワークフロー
- **要求分析**: SPEC-Q Frameworkによる効率的ヒアリング
- **設計・実装**: SPECに基づく段階的開発
- **品質保証**: 自動化された品質ゲートとクリーンアップ

### 開発支援機能
- **DRY原則**: 重複コード検出・リファクタリング支援
- **クリーンアーキテクチャ**: 依存関係の自動検証
- **Git最適化**: SPEC連動コミット・安全なブランチ操作

### プロジェクト管理
- **動的コンテキスト**: プロジェクト状況の自動把握
- **SPEC状態管理**: アクティブ・完了SPECの追跡
- **品質メトリクス**: テスト・カバレッジ・パフォーマンス監視

## 🏗️ プロジェクト構造

```
aidlc-agent/
├── README.md                    # このファイル
├── setup.sh                     # セットアップスクリプト
├── templates/
│   └── dev-agent.json.template  # エージェント設定テンプレート
├── contexts/                    # AIDLC理論・ルール
│   ├── aidlc.md                 # AIDLC組織構造理論
│   ├── SPEC-Q Framework.md     # 要求ヒアリング手法
│   ├── spec_rules.md            # SPEC管理ルール
│   ├── dry_rules.md             # DRY原則実装
│   ├── cleanup_rules.md         # コードクリーンアップ
│   ├── quality_gates.md         # 品質ゲート定義
│   ├── git_rules.md             # Git運用ルール
│   ├── project_startup.md       # プロジェクト初期化ガイド
│   └── spec_templates/          # SPECテンプレート
└── steering_seeds/              # プロジェクト設定プリセット
    ├── design_philosophy/       # 設計思想
    └── tech_stacks/            # 技術スタック設定
```

## 🛠️ 使用方法

### 新規プロジェクトの開始

1. **プロジェクトディレクトリで起動**
   ```bash
   cd your-project
   qcd  # または q chat --agent dev-agent
   ```

2. **プロジェクト初期化**
   - エージェントが自動でプロジェクト状況を分析
   - 未セットアップの場合、初期化ガイドを表示

3. **SPEC作成**
   ```
   新しい機能を実装したいです
   ```
   - SPEC-Q Frameworkによる要求ヒアリング
   - requirements/design/tasks/notesの自動生成

### 既存プロジェクトでの作業

1. **現在の状況確認**
   - アクティブSPECの表示
   - プロジェクト設定の自動読み込み

2. **SPEC駆動開発**
   - 既存SPECの継続実行
   - 新規SPECの作成・管理

## 🎯 AIDLC理論の詳細

### 有機的組織構造

**Cell (開発チーム)**:
- 3-4名のメンバーが2-4個のRepositoryを担当
- 定期的なUnit編成ローテーション
- 全員が全Repositoryを理解

**Unit (担当グループ)**:
- 1-2名で特定Repositoryを担当
- 単一コミッター制でコンフリクト回避
- 動的編成による学習効果最大化

**Repository (開発対象)**:
- 独立デプロイ可能な機能単位
- API境界が明確
- 1-2名で3ヶ月程度で完結

### SPEC-Q Framework

効率的な要求ヒアリング手法：
- **S**cope: 範囲確認
- **P**riority: 優先度確認  
- **E**xample: 具体例確認
- **C**onstraint: 制約確認
- **Q**uality: 品質確認

## 🔧 カスタマイズ

### エージェント設定の調整

`~/.aws/amazonq/cli-agents/dev-agent.json`を編集：
- 許可コマンドの追加・削除
- ファイル書き込み範囲の調整
- リソース読み込みの変更

### プロジェクト固有設定

`.kiro/steering/`ディレクトリに配置：
- `product.md`: プロダクト要件
- `structure.md`: プロジェクト構造
- `tech.md`: 技術決定

## 🤝 コントリビューション

1. このリポジトリをフォーク
2. フィーチャーブランチを作成
3. 変更をコミット
4. プルリクエストを作成

## 📄 ライセンス

MIT License

## 🆘 サポート

- **Issues**: バグ報告・機能要望
- **Discussions**: 使用方法・ベストプラクティス
- **Wiki**: 詳細ドキュメント・チュートリアル

---

**Happy coding with AIDLC! 🎉**
