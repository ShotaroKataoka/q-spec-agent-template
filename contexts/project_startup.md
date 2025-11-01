# ⚠️ MANDATORY: Project Initialization Required

**This context appears because `.kiro/steering/` does not exist.**
**You MUST execute the project initialization process before any other work.**

---

## 🚨 Required Actions (Execute in Order)

### 1. Declare Initialization
**ALWAYS start with this declaration:**
```
"このプロジェクトはまだ初期化されていません。
Q-SPECフレームワークに従ってプロジェクト初期化インタビューを実施します。"
```

### 2. Conduct Q-SPEC Interview for Project Setup
**Interview objectives:**
- Understand project purpose and vision
- Identify technology stack and language
- Determine appropriate design philosophy
- Define project structure

**Key questions to ask (use inference-based interview):**
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

### 3. Select steering_seeds
**Based on interview results, identify required seeds:**

Available seeds location: `{{REPO_PATH}}/steering_seeds/`
```
steering_seeds/
├── design_philosophy/    # Architecture patterns
└── tech_stacks/         # Language-specific standards
```

**Action:** List and read relevant seed files, then copy to `.kiro/steering/`

### 4. Create Basic Steering Files
**MUST create these 3 files:**

#### `.kiro/steering/product.md`
- Project vision and goals
- Core features
- Target users
- Roadmap (if applicable)

Reference: `{{REPO_PATH}}/steering_templates/product.md`

#### `.kiro/steering/tech.md`
- Technology stack
- Architecture decisions
- Technical constraints
- Development tools

Reference: `{{REPO_PATH}}/steering_templates/tech.md`
**Important:** Avoid duplicating content from copied steering_seeds

#### `.kiro/steering/structure.md`
- Project directory structure
- Module organization
- File naming conventions

Reference: `{{REPO_PATH}}/steering_templates/structure.md`

### 5. Confirm Completion
**After creating all files, show summary:**
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

## ⛔ Prohibited Actions
- **DO NOT skip initialization** and proceed directly to SPEC creation
- **DO NOT create SPEC** before steering files exist
- **DO NOT assume** steering content without interview

---

## 🎯 Success Criteria
- [ ] Q-SPEC interview conducted
- [ ] Appropriate steering_seeds identified and copied
- [ ] `.kiro/steering/product.md` created
- [ ] `.kiro/steering/tech.md` created
- [ ] `.kiro/steering/structure.md` created
- [ ] User confirmed completion
