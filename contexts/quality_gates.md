# Quality Gates

## Core Principle
**Tests are sacred - implementation must be fixed to make tests pass**

品質ゲートは実装完了の必須条件。すべてのSPECで適用する。

## Mandatory Quality Gates

### 1. Test Execution
- [ ] **All tests pass** - 既存テストを破綻させない
- [ ] **New functionality tested** - 新機能に対応するテスト追加
- [ ] **Edge cases covered** - エラーケース・境界値のテスト

### 2. Code Coverage
- [ ] **Coverage ≥ 80%** - 最低限の網羅性確保
- [ ] **Critical paths 100%** - 重要な処理は完全網羅
- [ ] **No untested public APIs** - 公開インターフェースは必須

### 3. Code Quality
- [ ] **No compilation errors** - 構文エラー・型エラーなし
- [ ] **No linting violations** - コードスタイル遵守
- [ ] **No security warnings** - 基本的なセキュリティチェック

## Language-Agnostic Validation

### Test Commands
```bash
# 基本テスト実行
[test-runner] [test-directory] -v

# カバレッジ付きテスト  
[test-runner] --coverage --coverage-target=80

# 特定タイプのテスト
[test-runner] -m [unit|integration|performance] -v
```

### Quality Commands
```bash
# コード品質チェック
[linter] [source-directory]
[type-checker] [source-directory] 
[security-scanner] [source-directory]
```

## Test Failure Response

### When Tests Fail
1. **Analyze failure** - 何が壊れたかを理解
2. **Fix implementation** - テストではなく実装を修正
3. **Verify fix** - 修正後の再テスト
4. **Never modify tests** - テストを通すためのテスト変更は禁止

### Exceptions (User explicit instruction only)
- 要件変更によるテスト更新
- テスト自体のバグ修正
- 明らかに間違ったテストの修正

### Coverage Insufficient
1. **Identify gaps** - 未テスト部分の特定
2. **Add missing tests** - 不足テストの追加
3. **Refactor if needed** - テストしにくいコードの改善

## Quality Standards

### Coverage Targets
- **Minimum**: 80% line coverage
- **Critical code**: 100% coverage
- **Public APIs**: 100% coverage

### Test Quality
- **Fast execution** - 単体テストは高速実行
- **Isolated tests** - テスト間の依存関係なし
- **Deterministic** - 実行順序に依存しない結果

---
**Created**: 2025-09-23
