# Project Steering Setup

## 初期化手順
1. **ディレクトリ作成**: `mkdir -p .kiro/steering`
2. **SPEC-Q Frameworkヒアリング**: プロジェクト要件の把握
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

### product.md作成
**目的**: プロジェクトビジョン、コア機能、ロードマップの定義

**SPEC-Q質問例**:
- **Scope**: "Webアプリケーション開発という理解で合っていますか？それとも[CLI/API/ライブラリ]のどれに近いですか？"
- **Priority**: "MVP機能として[ユーザー認証/データ管理/レポート機能]のうち最優先は？"
- **Example**: "想定ユーザーは[開発者/一般ユーザー/管理者]のどれが主ですか？"
- **Constraint**: "リリース目標は[1ヶ月/3ヶ月/半年]程度ですか？"
- **Quality**: "成功指標は[ユーザー数/処理速度/保守性]のどれを重視しますか？"

steering_templates/product.mdを参考にヒアリング結果で直接作成

### tech.md作成
**目的**: 技術スタック、アーキテクチャ決定、制約の記録

**SPEC-Q質問例**:
- **Scope**: "Python/FastAPI構成を想定していますが、他の言語・FWの希望はありますか？"
- **Priority**: "開発速度重視なら軽量構成、保守性重視なら堅牢な構成にしますが、どちらが適切ですか？"
- **Example**: "データベースは[SQLite/PostgreSQL/MySQL]のどれが環境に適していますか？"
- **Constraint**: "既存システムとの連携や、使用禁止の技術はありますか？"
- **Quality**: "テストカバレッジは[基本的/標準的(80%)/厳格(90%+)]のどのレベルですか？"

steering_templates/tech.mdを参考に技術決定を記述
選択されたsteering_seedsの内容を事前に確認し、内容の重複を避ける。

### structure.md作成
**目的**: プロジェクト構造、ディレクトリ構成、モジュール分割の定義

**SPEC-Q質問例**:
- **Scope**: "小規模プロジェクト向けのシンプル構成を想定していますが、[中規模/大規模]での拡張予定はありますか？"
- **Priority**: "開発初期は[速度重視のフラット構成/保守重視の階層構成]どちらが適切ですか？"
- **Example**: "チーム開発は[1-2人/3-5人/6人以上]のどの規模ですか？"
- **Constraint**: "既存のプロジェクト構造やコーディング規約はありますか？"
- **Quality**: "コードレビューは[なし/軽量/厳格]のどのレベルで行いますか？"

steering_templates/structure.mdを参考にプロジェクト構造を記述、選択された設計思想を反映

## 完了確認
- [ ] `.kiro/steering/product.md` 作成完了
- [ ] `.kiro/steering/tech.md` 作成完了  
- [ ] `.kiro/steering/structure.md` 作成完了
- [ ] 適切なsteering_seedsコピー完了
- [ ] プロジェクト固有の調整完了
