# Python Tech Stack Rules

## Quality Gates Implementation

### Test Execution
```bash
# 基本テスト
uv run pytest tests/ -v

# カバレッジ付きテスト
uv run pytest --cov=src --cov-report=term --cov-fail-under=80

# 並列実行（高速化）
uv run pytest -n auto tests/

# 失敗時即停止
uv run pytest -x tests/

# 特定タイプのテスト
uv run pytest -m unit -v
uv run pytest -m integration -v
uv run pytest -m performance -v
```

### Code Quality
```bash
# リンティング（推奨順序）
uv run black src/ tests/           # フォーマット
uv run isort src/ tests/           # インポート整理
uv run flake8 src/ tests/          # スタイルチェック
uv run mypy src/                   # 型チェック

# セキュリティ・依存関係
uv run bandit -r src/              # セキュリティ
uv run safety check                # 脆弱性
uv run pip-audit                   # 依存関係監査
```

## Python-Specific DRY Patterns

### 検索戦略
```bash
# デコレータ検索
grep -r "@.*" src/ | grep -v "__pycache__"

# 継承関係検索
grep -r "class.*(" src/

# 例外クラス検索
grep -r "Exception\|Error" src/

# 設定・定数検索
grep -r "^[A-Z_]*\s*=" src/
```

### 共通パターン検出
```bash
# バリデーション関数
grep -r "def.*valid" src/

# ファクトリーパターン
grep -r "def.*create\|def.*build" src/

# シングルトンパターン
grep -r "__new__\|_instance" src/
```

## Python-Specific Cleanup

### 自動検出・修正
```bash
# 未使用インポート削除
uv run autoflake --remove-all-unused-imports --remove-unused-variables --recursive --in-place src/

# インポート最適化
uv run isort --profile black src/ tests/

# 未使用コード検出
uv run vulture src/ --min-confidence 80

# 複雑度チェック
uv run radon cc src/ -a -nb
uv run xenon --max-absolute B --max-modules A src/
```

### Python特有の清掃対象
```bash
# キャッシュファイル削除
find . -name "__pycache__" -type d -exec rm -rf {} +
find . -name "*.pyc" -delete
find . -name "*.pyo" -delete

# 一時ファイル削除
find . -name ".pytest_cache" -type d -exec rm -rf {} +
find . -name ".coverage" -delete
find . -name "htmlcov" -type d -exec rm -rf {} +

# uv関連キャッシュ
uv cache clean
```

## Modern Python Development with uv

### プロジェクト初期化
```bash
# 新規プロジェクト作成
uv init my-project
cd my-project

# 既存プロジェクトでuv導入
uv init --no-readme

# Python バージョン指定
uv python install 3.12
uv python pin 3.12
```

### 依存関係管理
```bash
# パッケージ追加
uv add requests fastapi
uv add --dev pytest black mypy

# 依存関係インストール
uv sync

# 依存関係更新
uv lock --upgrade

# 仮想環境でコマンド実行
uv run python script.py
uv run pytest
```

### 高速実行
```bash
# スクリプト直接実行（依存関係自動解決）
uv run --with requests python -c "import requests; print(requests.get('https://httpbin.org/json').json())"

# 一時的なツール実行
uv tool run black --check .
uv tool run mypy src/
```

### デバッグ・プロファイリング
```bash
# デバッガー起動
uv run python -m pdb script.py

# プロファイリング
uv run python -m cProfile -o profile.stats script.py
uv run python -c "import pstats; pstats.Stats('profile.stats').sort_stats('cumulative').print_stats(10)"

# メモリプロファイリング
uv add --dev memory-profiler
uv run python -m memory_profiler script.py
```

## Python Development Tips

### パフォーマンス最適化
```python
# 高速な文字列結合
items = ['a', 'b', 'c']
result = ''.join(items)  # ✅ 高速
# result = '' + 'a' + 'b' + 'c'  # ❌ 低速

# リスト内包表記
squares = [x**2 for x in range(10)]  # ✅ 高速
# squares = []  # ❌ 低速
# for x in range(10):
#     squares.append(x**2)

# 辞書のget使用
value = dict.get('key', default)  # ✅ 安全
# value = dict['key'] if 'key' in dict else default  # ❌ 冗長

# f-string使用（Python 3.6+）
name = "world"
message = f"Hello, {name}!"  # ✅ 高速・可読
# message = "Hello, {}!".format(name)  # ❌ 低速
```

### 型ヒント活用
```python
from typing import List, Dict, Optional, Union, Callable

def process_data(
    items: List[Dict[str, Union[str, int]]],
    callback: Optional[Callable[[str], bool]] = None
) -> Dict[str, int]:
    """型ヒント付き関数定義"""
    pass

# Python 3.9+ の新しい型ヒント
def process_items(items: list[dict[str, str | int]]) -> dict[str, int]:
    pass
```

### エラーハンドリングパターン
```python
# 具体的な例外キャッチ
try:
    result = risky_operation()
except ValueError as e:
    logger.error(f"Invalid value: {e}")
    raise
except FileNotFoundError:
    logger.warning("File not found, using default")
    result = default_value()

# コンテキストマネージャー活用
with open('file.txt') as f:
    content = f.read()

# pathlib使用（推奨）
from pathlib import Path
config_file = Path("config") / "settings.json"
if config_file.exists():
    content = config_file.read_text()
```

## Project Structure Best Practices

### 推奨ディレクトリ構造
```
project/
├── pyproject.toml         # uv設定・依存関係
├── uv.lock               # ロックファイル
├── .python-version       # Python バージョン固定
├── src/
│   ├── __init__.py
│   ├── core/              # ビジネスロジック
│   │   ├── __init__.py
│   │   ├── models.py      # データモデル
│   │   └── services.py    # ビジネスサービス
│   ├── utils/             # 汎用ユーティリティ
│   │   ├── __init__.py
│   │   ├── helpers.py
│   │   └── validators.py
│   └── config/            # 設定管理
│       ├── __init__.py
│       └── settings.py
├── tests/
│   ├── __init__.py
│   ├── unit/
│   ├── integration/
│   └── fixtures/
└── README.md
```

### pyproject.toml設定例
```toml
[project]
name = "my-project"
version = "0.1.0"
description = ""
authors = [{name = "Author", email = "author@example.com"}]
dependencies = [
    "requests>=2.31.0",
    "pydantic>=2.0.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "pytest-cov>=4.0.0",
    "black>=23.0.0",
    "isort>=5.12.0",
    "mypy>=1.5.0",
    "flake8>=6.0.0",
]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[tool.coverage.run]
source = ["src"]
fail_under = 80
omit = ["*/tests/*"]

[tool.pytest.ini_options]
testpaths = ["tests"]
markers = [
    "unit: unit tests",
    "integration: integration tests",
    "performance: performance tests"
]

[tool.black]
line-length = 88
target-version = ['py312']

[tool.isort]
profile = "black"
multi_line_output = 3

[tool.mypy]
python_version = "3.12"
warn_return_any = true
warn_unused_configs = true
disallow_untyped_defs = true
```

---
**Created**: 2025-09-23
