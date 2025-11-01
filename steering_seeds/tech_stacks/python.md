# Python Tech Stack Rules for Q-SPEC Kit

## Core Principle
**動作する、重複しない、迷わない** - AIエージェント開発の三原則

## Essential Quality Gates

### 1. 機能確認（最重要）
```bash
uv run pytest tests/ -v --tb=short
```

### 2. 不要コード検出（エージェント効率）
```bash
uv run vulture src/ --min-confidence 80
uv run autoflake --check --remove-unused-variables --remove-all-unused-imports --recursive src/
```

### 3. 重複検出（DRY確認）
```bash
grep -r "def " src/ | sort | uniq -d
grep -r "class " src/ | sort | uniq -d
```

## Optional Quality Checks

### 型安全性（問題発生時のみ）
```bash
PYTHONPATH=. uv run mypy src/ --ignore-missing-imports
```

### セキュリティ（リリース前のみ）
```bash
uv run bandit -r src/
```

## Q-SPEC Kit Development Flow

### Before Implementation
```bash
# 既存コード検索（重複回避）
grep -r "target_function" src/
find . -name "*.py" -exec grep -l "similar_functionality" {} \;
```

### During Implementation
```bash
# 機能テスト（変更後即実行）
uv run pytest tests/unit/target_module/ -v
```

### After Implementation
```bash
# 不要コード削除（エージェント判断付き）
uv run vulture src/ --min-confidence 80

# 動作確認
uv run pytest tests/ -x
```

## AI Agent Specific Rules

### Context Preservation
- **明確な命名**：エージェントが理解しやすい関数・変数名
- **適切なコメント**：実装意図の記録（なぜそうしたか）
- **型ヒント**：エージェントの理解支援

### Efficiency Optimization
- **不要コード即削除**：混乱の原因を排除
- **重複実装回避**：実装前の既存コード確認必須
- **最小限実装**：必要最小限のコードのみ

### Error Prevention
- **段階的テスト**：小さな変更ごとにテスト実行
- **明確なエラーメッセージ**：デバッグ効率向上
- **依存関係最小化**：複雑性回避

## Prohibited Actions
- **コードスタイル修正**（black, isort, flake8）→ 開発効率を下げる
- **全ファイル一括処理**→ 必要な変更のみ実行
- **動作するコードの変更**→ 機能優先

## Modern Python with uv

### Essential Commands
```bash
# 依存関係管理
uv add package_name
uv sync

# テスト実行
uv run pytest tests/ -v

# 不要コード検出
uv run vulture src/ --min-confidence 80
```

### Project Structure
```
project/
├── pyproject.toml
├── src/
└── tests/
    ├── unit/
    └── integration/
```

---
**Created**: 2025-09-24 (Q-SPEC Kit最適化版)
**Target**: AI Agent Development Efficiency
