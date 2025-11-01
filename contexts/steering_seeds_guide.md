# Steering Seeds ガイド

## 📚 Steering Seedsとは

Steering Seedsは、技術スタックや設計思想に関する**標準とベストプラクティス**を定義したテンプレートファイルです。
プロジェクトの`.kiro/steering/`にコピーすることで、エージェントがこれらの標準に従って開発を進めます。

---

## 🌱 利用可能なSeeds

利用可能なseedsは、エージェント起動時に**"Available Steering Seeds"**セクションに表示されます。

### Seedsの種類:

**`design_philosophy/`** - 設計思想・アーキテクチャパターン
- 例: `clean_architecture.md`, `simplicity-first.md`

**`tech_stacks/`** - 言語・技術スタック固有の標準
- 例: `python.md`, `javascript.md`, `go.md`

---

## 📋 Seedsの選択と適用

### 初期化時の選択

プロジェクト初期化時に、以下の基準でseedを選択します：

1. **技術スタック**: 使用する言語に対応するseed
   - Pythonプロジェクト → `python.md`
   - JavaScriptプロジェクト → `javascript.md`

2. **設計思想**: プロジェクトの設計方針に合うseed
   - クリーンアーキテクチャ重視 → `clean_architecture.md`
   - シンプルさ重視 → `simplicity-first.md`

### プロジェクト途中での追加

プロジェクトが進行中でも、新しいseedを追加できます：

**追加が必要なケース:**
- 新しい技術スタックを導入する時
- 設計思想を追加・深化させる時
- チーム標準を統一する時

---

## 🔧 Seedsのコピー方法

### 手順:

1. **利用可能なseedsを確認**
   - "Available Steering Seeds"セクションを参照

2. **seedファイルの内容を読み込む**
   - Use `fs_read` tool (`steering_seeds/tech_stacks/python.md`)

3. **プロジェクトのsteeringディレクトリにコピー**
   - `cp steering_seeds/tech_stacks/python.md .kiro/steering/`

4. **必要に応じてseedをカスタマイズ**
   - コピーしたseedの内容はあくまでテンプレートのため、プロジェクトの要件に合わせて柔軟に修正します

5. **次回のエージェント起動時に自動読み込み**
   - `.kiro/steering/`内の全`.md`ファイルがコンテキストとして読み込まれます

---

## ⚠️ 注意事項

### tech.mdとseedファイルの内容重複を避ける

`.kiro/steering/tech.md`には、**プロジェクト固有の技術的決定事項のみ**を記載してください。

- ✅ **tech.md**: プロジェクト固有の設定、制約、ツール選定理由
- ✅ **steering seeds**: 言語・フレームワークの一般的な標準とベストプラクティス

**例:**
- `python.md` (seed): Pythonの一般的なコーディング規約、テスト方法
- `tech.md`: このプロジェクトで使うPythonバージョン、特定のライブラリ選定理由

### 複数のseedsを組み合わせる

複数のseedを同時に使用できます：
```
.kiro/steering/
├── product.md
├── tech.md
├── structure.md
├── python.md              # 技術スタック
└── clean_architecture.md  # 設計思想
```

---

## 🎯 ベストプラクティス

1. **必要最小限から始める**: 初期化時は必須のseedのみコピー
2. **必要に応じて追加**: プロジェクトの成長に合わせてseedを追加
3. **自由にカスタマイズ**: seedはテンプレートなので、プロジェクトに合わせて編集可能
4. **tech.mdとの使い分け**: seedは標準ルール、tech.mdはプロジェクト固有の決定事項
