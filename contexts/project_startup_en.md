# ⚠️ MANDATORY: Project Initialization Required

**This context appears because `.kiro/steering/` does not exist.**
**You MUST execute the project initialization process before any other work.**

---

## 🚨 Required Actions (Execute in Order)

### 1. Declare Initialization
**ALWAYS start with this declaration:**
```
"This project has not been initialized yet.
I will conduct a project initialization interview following the Q-SPEC Framework."
```

### 2. Conduct Q-SPEC Interview for Project Setup
**Interview objectives:**
- Understand project purpose and vision
- Identify technology stack and language
- Determine appropriate design philosophy
- Define project structure

**Key questions to ask (use inference-based interview):**
```
📊 Project type:
├─ Web application
├─ CLI tool  
├─ Library/Package
├─ Game
└─ Other

What type of project are you building?
```

```
🔍 Technology stack:
Have you decided on the language or framework to use?
Examples: Python, JavaScript, Go, Rust, etc.
```

```
💬 Design philosophy:
What aspects are important for your project design?
Examples: Simplicity, Scalability, Performance, Maintainability
```

### 3. Select steering_seeds (MANDATORY)
**Based on interview results, you MUST select and copy appropriate seeds.**

**For detailed instructions, refer to `steering_seeds_guide.md`.**

**Quick steps:**
1. Check available seeds (see "Available Steering Seeds" section above)
2. Read relevant seed files
3. Copy to `.kiro/steering/` (keep original filenames)

**DO NOT skip this step** - Seeds contain important standards and best practices.

### 4. Create Basic Steering Files
**MUST create these 3 files:**

#### `.kiro/steering/product.md`
- Project vision and goals
- Core features
- Target users
- Roadmap (if applicable)

Reference: `{{REPO_PATH}}/contexts/steering_templates/product.md`

#### `.kiro/steering/tech.md`
- Technology stack
- Architecture decisions
- Technical constraints
- Development tools

Reference: `{{REPO_PATH}}/contexts/steering_templates/tech.md`

**Important:** Avoid duplicating content from copied steering_seeds.
This file should contain only project-specific technical decisions.

#### `.kiro/steering/structure.md`
- Project directory structure
- Module organization
- File naming conventions

Reference: `{{REPO_PATH}}/contexts/steering_templates/structure.md`

### 5. Confirm Completion
**After creating all files, show summary:**
```
✅ Project initialization completed

Created files:
├─ .kiro/steering/product.md
├─ .kiro/steering/tech.md
├─ .kiro/steering/structure.md
└─ .kiro/steering/[copied seeds]

From next session, these steering files will be loaded as context.
Shall we proceed with your original request?
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
