
# Commit のルール
## git add は適切にファイルを選択をする
- Make the appropriate `.gitignore`.
- `git add .`を禁止する。

commitの単位を意識し、同一のcommitに含めるファイルを選択してaddをする。
複数のコーディングエージェントが同時に複数の異なるSPECで作業を行うことがあることに注意する。

## Commit Format:
```bash
✨ feat(scope): description     # New feature
🐛 fix(scope): description      # Bug fix
♻️ refactor(scope): description # Code restructuring  
🧹 cleanup(scope): description  # Remove obsolete files
📚 docs(scope): description     # Documentation updates
🔧 config(scope): description   # Configuration changes
🎯 perf(scope): description     # Performance improvements
```

## Complete with Memory-Preserving Commit
```bash
# Mark SPEC complete if applicable
# PROACTIVELY ASK USER: "Tasks are complete. Should I create report.md and close this SPEC?"
# Create report.md using SPEC Report Template
# Move to .kiro/specs/closed/YYYYMMDD/ if fully done or closed

# Commit with detailed context for future sessions
git add [files]
git commit -m "✨ feat(scope): implement feature per SPEC design

SPEC: [spec-name]
Related SPECs: [related-spec-1], [related-spec-2]

Implementation details:
- Core functionality: [what was built]
- Architecture decisions: [key technical choices]
- Dependencies added/removed: [specific changes]
- Breaking changes: [compatibility impacts]
- Testing approach: [how it was validated]

Context for future sessions:
- Feature addresses: [specific user need]
- Design rationale: [why this approach]
- Integration points: [how it connects to existing code]
- Future considerations: [what to watch for]"
```

### Branch Strategy:
- **main**: Production-ready code only
- **develop**: 開発は基本的にこのブランチで行う
- **feature/spec-name**: もし危険な破壊的変更を含む場合はdevelopでの作業を避け、独立したブランチを作成する
