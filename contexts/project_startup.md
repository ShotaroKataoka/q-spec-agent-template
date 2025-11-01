# ⚠️ 必須: プロジェクト初期化が必要です

**このコンテキストは `.kiro/steering/` が存在しないために表示されています。**
**他の作業を行う前に、プロジェクト初期化プロセスを実行する必要があります。**

---

## 🚨 必須アクション（順番に実行）

### 1. Declare Initialization
**必ずこの宣言から始めてください:**
```
"このプロジェクトはまだ初期化されていません。
Q-SPECフレームワークに従ってプロジェクト初期化ヒアリングを実施します。"
```

### 2. Conduct Q-SPEC Interview for Project Setup
**ヒアリングの目的:**
- プロジェクトの目的とビジョンを理解する
- 技術スタックと言語を特定する
- 適切な設計思想を決定する
- プロジェクト構造を定義する

**質問例（推論ベースインタビューを使用）:**
```
📊 プロジェクトの種類:
├─ Webアプリケーション
├─ CLIツール  
├─ ライブラリ/パッケージ
├─ ゲーム
└─ その他

どのような種類のプロジェクトですか？
```

```
🔍 技術スタック:
使用する言語やフレームワークは決まっていますか？
例: Python, JavaScript, Go, Rust, etc.
```

```
💬 設計思想:
プロジェクトの設計で重視したいことはありますか？
例: シンプルさ、拡張性、パフォーマンス、保守性
```

### 3. Select steering_seeds (必須)
**ヒアリング結果に基づいて、適切なseedを選択してコピーする必要があります。**

**詳細な手順は `steering_seeds_guide.md` を参照してください。**

**簡易手順:**
1. 利用可能なseedsを確認（上記"Available Steering Seeds"セクション）
2. 関連するseedファイルを読み込む
3. `.kiro/steering/`にコピー（ファイル名はそのまま維持）

**このステップをスキップしないでください** - Seedsには重要な標準とベストプラクティスが含まれています。

### 4. Create Basic Steering Files
**必ず以下の3つのファイルを作成してください:**

#### `.kiro/steering/product.md`
- プロジェクトのビジョンと目標
- コア機能
- ターゲットユーザー
- ロードマップ（該当する場合）

参考: `{{REPO_PATH}}/contexts/steering_templates/product.md`

#### `.kiro/steering/tech.md`
- 技術スタック
- アーキテクチャの決定事項
- 技術的制約
- 開発ツール

参考: `{{REPO_PATH}}/contexts/steering_templates/tech.md`

**重要:** コピーしたsteering_seedsの内容と重複しないようにしてください。
このファイルにはプロジェクト固有の技術的決定事項のみを記載します。

#### `.kiro/steering/structure.md`
- プロジェクトのディレクトリ構造
- モジュール構成
- ファイル命名規則

参考: `{{REPO_PATH}}/contexts/steering_templates/structure.md`

### 5. Confirm Completion
**全てのファイル作成後、サマリーを表示:**
```
✅ プロジェクト初期化が完了しました

作成されたファイル:
├─ .kiro/steering/product.md
├─ .kiro/steering/tech.md
├─ .kiro/steering/structure.md
└─ .kiro/steering/[copied seeds]

次回からはこれらのsteeringファイルがコンテキストとして読み込まれます。
ユーザーの本来の要求に進みますか？
```

---

## ⛔ 禁止事項
- **初期化をスキップして** SPEC作成に直接進まないこと
- steeringファイルが存在する前に **SPECを作成しない**こと
- ヒアリングなしでsteeringの内容を **推測しない**こと

---

## 🎯 成功基準
- [ ] Q-SPECヒアリングを実施した
- [ ] 適切なsteering_seedsを特定してコピーした
- [ ] `.kiro/steering/product.md` を作成した
- [ ] `.kiro/steering/tech.md` を作成した
- [ ] `.kiro/steering/structure.md` を作成した
- [ ] ユーザーが完了を確認した
