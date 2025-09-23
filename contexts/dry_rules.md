# DRY Rules (Don't Repeat Yourself)

## Core Principle
**Every piece of knowledge must have single, unambiguous, authoritative representation**

重複は技術的負債の最大要因。実装前の既存コード検索は必須。

## Implementation Rules

### 1. 実装前の必須チェック
```bash
# ファイル名での検索
find . -name "*similar_name*"

# 機能名での検索  
grep -r "function_name" src/
grep -r "class.*Name" src/

# 既存モジュールの確認
ls src/core/ src/utils/ src/services/
```

### 2. 重複発見時の対応
- **即座にリファクタリング** - 重複を放置しない
- **共通化の実装** - 単一の実装に統合
- **既存パターンの活用** - プロジェクト内の慣例に従う

### 3. 許可される重複
- **テストコード** - 可読性のための重複は許可
- **設定ファイル** - 環境別の設定値
- **ドキュメント** - 異なる文脈での説明

## 検索戦略

### 機能別検索
```bash
# バリデーション機能
grep -r "validate\|validation" src/

# 認証機能  
grep -r "auth\|login\|token" src/

# データベース操作
grep -r "save\|find\|update\|delete" src/
```

### パターン別検索
```bash
# エラーハンドリング
grep -r "try\|catch\|except\|error" src/

# 設定読み込み
grep -r "config\|setting\|env" src/

# ログ出力
grep -r "log\|print\|console" src/
```

## 共通化の指針

### 抽出すべき重複
- **3回以上の繰り返し** - Rule of Three
- **ビジネスロジック** - 重要な処理ルール
- **複雑な計算** - アルゴリズム的処理

### 共通化を避けるべき重複
- **偶然の一致** - 似ているが本質的に異なる処理
- **将来の分岐予定** - 要件変更で分岐する可能性が高い
- **単純すぎる処理** - 1-2行の簡単な処理

---
**Created**: 2025-09-23
