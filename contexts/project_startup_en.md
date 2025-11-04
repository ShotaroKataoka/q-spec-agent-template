# ⚠️ MANDATORY: Project Initialization Required

**This context appears because `.kiro/steering/` does not exist.**
**You MUST execute the project initialization process before any other work.**

---

## 🚨 Required Actions

### Initialization Declaration
**ALWAYS start with this declaration:**
```
"This project has not been initialized yet.
I will conduct a project initialization interview following the Q-SPEC Framework."
```

---

## 📋 Initialization Process

**Important**: Utilize the Q-SPEC Framework (S/P/E/C) and flexibly adjust the interview based on user responses.

---

### Phase 1: Project Understanding (vision.md creation)

**Objective**: Understand the essence of the project

**Information to elicit**:
- Problem to solve
- Target users
- Project goal
- Values (what matters most)
- Out of scope (what NOT to do)

**How to conduct interview**:
Use inference-based interview to elicit information. Utilize Q-SPEC Framework:
- **S (Scope)**: Grasp the overall picture
- **P (Pathfinding)**: Identify areas to deep-dive
- **E (Elicit)**: Draw out tacit knowledge with concrete examples
- **C (Constrain)**: Converge scope

**Deliverable**: `.kiro/steering/vision.md`  
**Template**: `contexts/steering_templates/vision.md`

---

### Phase 2: Steering Seeds Selection (Recommended)

**Objective**: Establish design philosophy and technical standards

Design philosophy and tech stack best practices are available as seeds.
Should actively use appropriate seeds when available.

**Available seeds**:
- `steering_seeds/design_philosophy/`: clean_architecture.md, simplicity_first.md, etc.
- `steering_seeds/tech_stacks/`: python.md, typescript.md, etc.

**Selection process**:
1. **Select design philosophy seed** (based on project complexity)
   - Simple project → simplicity_first.md
   - Layer separation needed → clean_architecture.md
   - Complex domain → domain_driven_design.md
   
2. **Select tech stack seed** (if using a supported language)
   - Python → python.md
   - TypeScript → typescript.md

3. **Read and explain each seed**
   - `fs_read steering_seeds/[category]/[seed].md`
   - Explain key principles and confirm if appropriate for the project

4. **Copy to `.kiro/steering/`**

5. **Adjust to fit the project**
   - Design philosophy seeds: Basically use as-is (don't change philosophy)
   - Tech stack seeds: Adjust to fit project as needed
   - Adjustment example: "It says 80% coverage, is that appropriate for this project?"
   - Clarify reasons when adjusting (e.g., relaxed to 60% because it's a prototype)

**Important**: Select design philosophy seed before tech stack seed (order matters)

**Deliverable**: Copy selected seeds to `.kiro/steering/`

---

### Phase 3: Technical Decisions (tech.md creation)

**Objective**: Define technical decisions not covered by seeds

**Information to elicit**:
- Technology stack (language, framework, version)
- Supported platforms
- External dependency policy
- Technical constraints not covered by seeds

**Important**: tech.md serves as a **complement** to seeds
- If seeds exist: Record only information not covered by seeds
- If no seeds: Record all technical decisions

**Deliverable**: `.kiro/steering/tech.md`  
**Template**: `contexts/steering_templates/tech.md`

---

### Final Confirmation

**After creating all files, display summary:**

```
✅ Project initialization completed

Created files:
├─ .kiro/steering/vision.md (required)
├─ .kiro/steering/[design philosophy seed].md (recommended)
├─ .kiro/steering/[tech stack seed].md (recommended)
└─ .kiro/steering/tech.md (required)

From the next session, these steering files will be loaded as context.
```

---

## ⚠️ Important Notes

### Record "Universal Truths"

In steering files, record only principles that will not change regardless of project evolution.

✅ Good examples:
- "This tool operates as a CLI" (essence of the project)
- "Prioritize simplicity over feature richness" (unchanging value)
- "Support Python 3.10 or higher" (technical boundary)

❌ Bad examples:
- "Currently has 3 commands" (implementation state, variable information)
- "Implement basic features in Phase 1" (roadmap, variable information)
- "User class exists in src/core/user.py" (implementation details, variable information)

### Role Division: Seeds and Tech.md

- **steering_seeds**: General best practices for languages/frameworks
- **tech.md**: Project-specific technical decisions (complement to seeds)

**Seed adjustment policy**:
- **Design philosophy seeds**: Basically use as-is (don't change philosophy)
- **Tech stack seeds**: Adjust to fit project as needed (clarify adjustment reasons)

**Example**:
- `python.md` (seed source): General Python coding conventions, 80% coverage
- `python.md` (in steering): Adjusted for this project, 60% coverage (reason: prototype)
- `tech.md`: Python version used in this project, specific library selection reasons

### Seeds Selection Order

**MUST execute in this order:**
1. Design philosophy seeds selection → Structure principles determined
2. Tech stack seeds selection → Language standards determined
3. tech.md creation → Complement to seeds

If reversed, design philosophy won't be reflected in structure.

---

## ⛔ Prohibited Actions

- DO NOT skip initialization and proceed directly to SPEC creation
- DO NOT create SPEC before steering files exist
- DO NOT assume steering content without interview
- DO NOT mechanically read questions (respond flexibly)

---

## 🎯 Success Criteria

- [ ] Conducted interview following Q-SPEC Framework
- [ ] Created `.kiro/steering/vision.md`
- [ ] Selected and copied appropriate seeds
- [ ] Created `.kiro/steering/tech.md`
- [ ] "Universal truths" are recorded in each file
- [ ] User confirmed completion
