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

## 📋 Initialization Process (4 Phases)

**Important**: The following is a "guideline", not a "question template".
Utilize the Q-SPEC Framework (S/P/E/C) and flexibly adjust the interview path based on user responses.

---

### Phase 1: Project Understanding (vision.md creation)

**Objective**: Understand the essence of the project

**Information to elicit**:
- Problem to solve (Problem Statement)
- Target users (Target Users)
- Differences from existing solutions (Existing Solutions & Gaps)
- Project goal (Project Goal)
- Success criteria (Success Criteria)

**How to conduct inference-based interview**:

1. **Start with open questions**
   - "What problem does this project solve?"
   - "Who will use this project?"

2. **Build inferences from user responses**
   - Analyze responses and determine what information to confirm next
   - S (Scope): Grasp the overall picture
   - P (Pathfinding): Identify areas to deep-dive

3. **Present inferences and deep-dive**
   - "So it's the problem of XX. How are you currently dealing with it?"
   - "You're dealing with it using YY, but what is unsatisfactory about it?"
   - E (Elicit): Draw out concrete examples

4. **Clarify boundaries**
   - "Conversely, what will this project NOT do?"
   - C (Constrain): Converge scope

**Question examples (reference)**:
```
Problem deep-dive:
- "What problem does it solve?"
- "How are you currently dealing with it?"
- "What is unsatisfactory about that approach?"

User understanding:
- "Who will use it?"
- "What is the users' technical level?"
- "What do users value most?"

Goal clarification:
- "What would constitute success?"
- "What is the most important feature?"
- "What will you NOT do?"
```

**Deliverable**: Create `.kiro/steering/vision.md`  
**Template**: `contexts/steering_templates/vision.md`

---

### Phase 2: Value Clarification (principles.md creation)

**Objective**: Determine decision criteria and trade-off priorities

**Information to elicit**:
- Core values (Core Values)
- Decision framework (Decision Framework)
- Trade-off priorities (Trade-off Priorities)
- Consistency rules (Consistency Rules)

**How to conduct inference-based interview**:

1. **Elicit values**
   - "What is most important for the project?"
   - Infer trade-off scenarios from user responses

2. **Confirm trade-off priorities**
   - "Simplicity vs feature richness, which do you prioritize?"
   - "Why do you prioritize XX?"
   - Confirm multiple trade-offs

3. **Confirm specific design decisions**
   - "How will you standardize error handling?"
   - "What is the configuration injection method?"
   - Extract consistency rules from user responses

4. **Clarify decision criteria**
   - "When adding new features, what criteria do you use?"
   - If response is vague, confirm with concrete examples

**Question examples (reference)**:
```
Value priorities:
- "What is most important?"
- "Simplicity vs feature richness"
- "Performance vs readability"
- "Flexibility vs convention"

Consistency rules:
- "How to standardize error handling?"
- "Configuration injection method?"
- "Logging policy?"

Decision criteria:
- "Criteria for adding features?"
- "Criteria for technology selection?"
```

**Deliverable**: Create `.kiro/steering/principles.md`  
**Template**: `contexts/steering_templates/principles.md`

---

### Phase 3: Design Philosophy Selection (seeds selection & copy)

**Objective**: Choose appropriate design philosophy for the project

**Information to elicit**:
- Project complexity
- Need for layer separation
- Domain model complexity

**How to conduct inference-based interview**:

1. **Confirm complexity**
   - "What is the complexity level of this project?"
   - "Do you think layer separation is necessary?"

2. **Infer appropriate design philosophy from responses**
   - Simple → Simplicity-First
   - Layer separation needed → Clean Architecture
   - Complex domain → Domain-Driven Design

3. **Read seed and explain content**
   - `fs_read steering_seeds/design_philosophy/[selected seed].md`
   - Explain key principles
   - "Is this appropriate for this project?"

4. **Copy seed after user confirmation, adjust if necessary**
   - `cp steering_seeds/design_philosophy/[selected seed].md .kiro/steering/`
   - Basically use as-is
   - Adjust if certain principles need relaxation due to project characteristics
   - Example: Simplify Clean Architecture's 4 layers to 3 layers, etc.

**Important**: 
- Design philosophy seeds are "philosophy", so basically use as-is
- Tech stack seeds are "concrete criteria", so adjust to fit the project
- Clarify reasons when adjusting

**Available design philosophy seeds**:
- Refer to "Available Steering Seeds" section at agent startup
- Check files under `steering_seeds/design_philosophy/`

**Deliverable**: Copy design philosophy seed to `.kiro/steering/`

---

### Phase 4: Technical Constraints Definition (constraints.md creation + seeds selection & copy)

**Objective**: Clarify technical boundaries

**Information to elicit**:
- Technical boundaries (Technical Boundaries)
- Prohibited practices (Prohibited Practices)
- Dependency policy (Dependency Policy)
- Compatibility requirements (Compatibility Requirements)

**How to conduct inference-based interview**:

1. **Confirm technology stack**
   - "What language will you use?"
   - "What version? Why that version?"
   - "What framework?"
   - "What platform?"

2. **Read tech stack seed and explain**
   - `fs_read steering_seeds/tech_stacks/[language].md`
   - Explain coding conventions, testing methods, etc.
   - "Will you apply this to this project?"

3. **Copy seed after user confirmation, adjust to fit project**
   - `cp steering_seeds/tech_stacks/[language].md .kiro/steering/`
   - After copying, adjust while confirming content
   - "It says 80% coverage, is that appropriate for this project?"
   - "It says type hints are mandatory, will they be mandatory for this project too?"
   - Adjust criteria that don't fit the project

**Important**: 
- Seeds are "general standards" and may not fit all projects
- Adjust to project characteristics to make it "this project's truth"
- Clarify reasons for adjustment (why deviate from standard)

**Available tech stack seeds**:
- Refer to "Available Steering Seeds" section at agent startup
- Check files under `steering_seeds/tech_stacks/`

4. **Confirm constraints**
   - "What are the support scope boundaries?"
   - "What must absolutely not be done?"
   - "What is the external dependency policy?"
   - "What are the compatibility requirements?"

**Question examples (reference)**:
```
Technology stack:
- "Language and version? Why?"
- "Framework? Selection reason?"
- "Platform?"

Constraints:
- "Support scope?"
- "Prohibitions? Reasons?"
- "External dependency policy?"
- "Compatibility requirements?"
```

**Deliverables**: 
- Create `.kiro/steering/constraints.md`
- Copy tech stack seed to `.kiro/steering/`

**Template**: `contexts/steering_templates/constraints.md`

---

### Final Confirmation

**After creating all files, display summary:**

```
✅ Project initialization completed

Created files:
├─ .kiro/steering/vision.md
├─ .kiro/steering/principles.md
├─ .kiro/steering/constraints.md
├─ .kiro/steering/[design philosophy seed].md
└─ .kiro/steering/[tech stack seed].md

📋 Content verification:
- vision.md: Is the project's reason for existence clear?
- principles.md: Are decision criteria specific?
- constraints.md: Are technical boundaries clear?
- seeds: Are appropriate seeds selected?

From the next session, these steering files will be loaded as context.
Shall we create the first SPEC?
```

---

## ⚠️ Important Notes

### Utilize Q-SPEC Framework

Use the Q-SPEC Framework even in initialization interviews:

- **S (Scope)**: Grasp the project's overall picture and identify the scope of necessary information
- **P (Pathfinding)**: Determine which areas to deep-dive next based on user responses
- **E (Elicit)**: Concretize abstract responses, draw out tacit knowledge
- **C (Constrain)**: Converge scope, clarify boundaries

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

### Role Division: seeds and steering

- **steering_seeds**: General best practices for languages/frameworks (copy source)
- **steering files**: Project-specific decision criteria, constraints, values + adjusted seeds

**Seed customization policy**:
- **Design philosophy seeds**: Basically use as-is (don't change philosophy)
- **Tech stack seeds**: Adjust to fit project (concrete criteria are adjustable)

**Example**:
- `python.md` (seed source): General Python coding conventions, 80% coverage
- `python.md` (in steering): Adjusted for this project, 60% coverage (reason: prototype)
- `constraints.md` (steering): Python version used in this project, prohibitions

### Seeds Selection Order

**MUST execute in this order:**
1. Design philosophy seeds selection → Structure principles determined
2. Tech stack seeds selection → Language standards determined

If reversed, design philosophy won't be reflected in structure.

---

## ⛔ Prohibited Actions

- **DO NOT skip initialization** and proceed directly to SPEC creation
- **DO NOT create SPEC** before steering files exist
- **DO NOT assume** steering content without interview
- **DO NOT copy seeds without reading** them
- **DO NOT select tech stack seeds** before selecting design philosophy seeds
- **DO NOT mechanically read questions** (respond flexibly)

---

## 🎯 Success Criteria

- [ ] Conducted interview following Q-SPEC Framework
- [ ] Flexibly adjusted interview path based on user responses
- [ ] Identified, read, explained, and copied appropriate design philosophy seeds
- [ ] Identified, read, explained, and copied appropriate tech stack seeds
- [ ] Created `.kiro/steering/vision.md`
- [ ] Created `.kiro/steering/principles.md`
- [ ] Created `.kiro/steering/constraints.md`
- [ ] "Universal truths" are recorded in each file
- [ ] Sufficient specificity for agents to use as decision criteria
- [ ] User confirmed completion
