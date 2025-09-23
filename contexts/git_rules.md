
# Git Rules for SPEC-Driven Development

## Core Principles
- **SPEC-aligned commits**: 各コミットは特定のSPECに関連付ける
- **Atomic commits**: 1つの論理的変更 = 1つのコミット
- **Context preservation**: 将来のエージェントセッション向けに十分なコンテキストを保存

## File Selection Rules
- **適切な.gitignoreを作成**
- **`git add .`を禁止** - 意図的なファイル選択を強制
- **SPEC単位でのファイル選択** - 同一SPECに関連するファイルのみを含める
- **複数エージェント対応** - 他のSPECの変更を混入させない

## Commit Format
```bash
✨ feat(spec-name): description     # New feature
🐛 fix(spec-name): description      # Bug fix  
♻️ refactor(spec-name): description # Code restructuring
🧹 cleanup(spec-name): description  # Remove obsolete files
📚 docs(spec-name): description     # Documentation updates
🔧 config(spec-name): description   # Configuration changes
🎯 perf(spec-name): description     # Performance improvements
🔒 spec(spec-name): description     # SPEC files update
```

**scope = SPEC名** (タイムスタンプ除く)
例: `feat(user-auth): implement login endpoint`

## Branch Strategy
- **main**: Production-ready code only
- **develop**: 通常の開発作業 (複数SPECが並行)
- **feature/SPEC名**: 破壊的変更や実験的実装時のみ

## SPEC-Linked Commit Process

### 通常のコミット (開発中)
```bash
git add [spec関連ファイルのみ]
git commit -m "✨ feat(user-auth): implement password validation

SPEC: 20240923-1100_implement-user-auth
Progress: requirements.md, design.md完了
Next: tasks.mdの実装開始"
```

### SPEC完了時のコミット
```bash
# 1. report.md作成
# 2. SPECをclosedに移動  
# 3. 完了コミット
git add [spec関連ファイルのみ]
git commit -m "✅ feat(user-auth): complete user authentication system

SPEC: 20240923-1100_implement-user-auth → closed/20240923/
Status: All tasks completed, tests passing
Impact: New user login/logout functionality
Files: src/auth/, tests/auth/, docs/auth.md"
```
