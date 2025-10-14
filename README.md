# AIDLC Agent

**AI Development Life Cycle (AIDLC)** - AIエージェント時代の新しい開発ライフサイクル理論とカスタムエージェント

## 🎯 概要

AIDLCは、AIエージェントの特性を活かした革新的な開発手法です。従来の人間中心の開発プロセスから、AIエージェントとの協調を前提とした効率的な開発体制に変革します。

### 核となる理論

- **Rotation Cell**: Cluster/Cell/Unit による動的な開発体制
- **ALL YOU NEED is SPEC (AYNiS)**: 全ての作業をSPEC駆動で管理する
- **Q-SPEC Framework**: AIエージェント向け効率的推測ヒアリング
- **SPEC as an Asset**: SPECを知識資産として再利用する

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
- エージェント名の選択（複数エージェント対応）
- カスタムエージェント設定の生成
- 推奨MCPサーバーの選択（オプション）
- `~/.aws/amazonq/cli-agents/`への配置
- シェルエイリアスの設定（オプション）

### 3. エージェント起動

```bash
q chat --agent dev-agent
# または設定したエイリアス（例: qcd）
```

## 📋 主な機能

### MCP (Model Context Protocol) 統合
- **推奨MCPサーバー**: AWS Documentation, Pricing, Diagram等
- **カスタマイズ可能**: プロジェクトに応じたMCP追加
- **セットアップ時選択**: 必要なMCPのみ導入可能
- 詳細: [MCP_SERVERS.md](MCP_SERVERS.md)

### SPEC駆動開発ワークフロー
- **要求分析**: Q-SPEC Frameworkによる効率的ヒアリング
- **設計・実装**: SPECに基づく段階的開発
- **品質保証**: 自動化された品質ゲートとクリーンアップ

### 開発支援機能
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
├── MCP_SERVERS.md              # MCP設定ガイド
├── setup.sh                     # セットアップスクリプト
├── mcp_servers.json            # 推奨MCPサーバー設定
├── templates/
│   └── dev-agent.json.template  # エージェント設定テンプレート
├── contexts/                    # AIDLC理論・ルール
│   ├── aidlc.md                 # AIDLC組織構造理論
│   ├── Q-SPEC Framework.md     # 推測ヒアリング手法
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
   - Q-SPEC Frameworkによる要求ヒアリング
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
**Cluster (プロジェクト組織)**:
- 複数のCellの集合
- 開発単位やCellの分割を指揮するPMが存在
- Cell同士のSyncを定期的に実施

**Rotation Cell (開発チーム)**:
- 3~5名程度のメンバーからなる
- 3つ程度のUnitが、それぞれ1つずつの機能単位(リポジトリ)を担当
- こまめなCell内Syncと定期的なUnit編成ローテーションにより、全員が全RepositoryのOwnershipを持つ
- Unit管理、ローテーション期間、リポジトリ分割、Sync調整などの担当リーダーが存在
- Cellは有機的変化に強い、冗長かつ効率的な組織を目指す
   - メンバーやUnit、リポジトリの構造的変更が頻繁に発生するが、問題なく継続可能

**Unit (担当グループ)**:
- 1-2名で特定Repositoryを担当
- 開発リポジトリローテーションのたびにUnit再編成
- 単一コミッター制でコンフリクト回避
- 2名編成の場合は、1名がコミッターで1名がアシスタントとなる
   - コミッターは熟練者が担当する
   - アシスタントは調査SPECやドキュメンテーションなど、コミッターの補助を実施する
      - New Joinerのオンボーディングとして活用可能

**Repository (開発対象)**:
- 独立デプロイ可能な機能単位
   - もしくはgit submoduleによるリポジトリ分離
- 構造的にコンフリクトが発生しないため、
   - ブランチは`main`, `develop`, `cell`のような簡素な構成で問題ない
   - linterやformatterのようなコーディングスタイル標準化ツールも導入不要

### Q-SPEC Framework
**5つの視点を常時意識する思考習慣**
- **Q (Question)**: 「全体像・粒度は適切か？」
- **S (Suggest)**: 「推論提示で導けているか？」  
- **P (Prioritize & Probe)**: 「重要度判定・深掘りできているか？」
- **E (Elicit)**: 「具体例・制約を引き出せているか？」
- **C (Coordinate)**: 「ヒアリングの深さと幅のバランスは取れているか？」

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
