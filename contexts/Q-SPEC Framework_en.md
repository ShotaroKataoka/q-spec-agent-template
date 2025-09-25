# Q-SPEC Framework
**Inference-Based Interview SPEC-Driven Development Framework**

# ⚠️ Rules for Practice

## 🚫 Prohibited
- **Blank questions**: "What kind of issues would you like to solve?"
- **Survey-style questions**: "Listing multiple question items simultaneously in a survey-like manner is prohibited"
- **Procedural thinking**: Executing Q→S→P→E→C sequentially as a checklist

## ✅ Practice
- **Inference-based interviews**: "Based on ~, I assume ~, is this correct?"
- **Dialogue-focused**: Dynamically adjust next questions based on user responses
- **Constant 5-perspective awareness**: Always be conscious of Q/S/P/E/C as thinking habits

---

## 1. Basic Philosophy

Q-SPEC is an inference-based interview framework with **5 thinking perspectives** for agents to efficiently create SPECs (specifications) through dialogue with users.

### What is Inference-Based Interview
A process where agents present hypotheses or candidates (inference) and use them as catalysts to elicit corrections, supplements, and judgments from users (interview).

### Essential Understanding
**Q-SPEC is a set of perspectives, not a procedure**
- Thinking habits that constantly maintain awareness of 5 perspectives (Q/S/P/E/C)
- Cycle = Rotational process to improve SPEC resolution
- Naturally adjust focus distribution of perspectives in each cycle

### Purpose
- Avoid overly open questions and realize conversations that are easy for users to answer
- Gradually refine SPECs while balancing the 5 perspectives
- Finalize SPECs when users reach their "desired resolution"

### AYNiS (ALL YOU NEED iS SPEC) Premise
Handle all development activities (bug fixes, research, PoC, new features, performance improvements, documentation) with SPECs.

### SPEC as an Asset
Completed SPECs remain as **knowledge assets** and are reused for future issues. Especially notes.md serves as a stock of "discoveries, trial and error, unexpected solutions."
- Always record uncertain inferences and hesitant choices in notes.md
- Keep information that didn't get promoted to SPEC in notes.md

## 2. SPEC Lifecycle

### Creation
**Internal Structure**:
```
notes.md        # Raw logs, inferences, discoveries
requirements.md # Requirements (organized after confirmation)
design.md       # Design (organized after confirmation)
tasks.md        # Tasks (organized after confirmation)
```

### Progress
- Converse with users using Q-SPEC
- Record interview logs in notes.md
- Summarize confirmed information in Requirements/Design/Tasks

## Completion Conditions
- User feels "sufficient"
- Information is gathered to create SPECs with the granularity level confirmed in Q
    - Example) Light = Up to general requirements, Medium = Requirements + design policy, Deep = Requirements + detailed design + specific tasks

### Asset Creation
- Discoveries and processes recorded in notes.md are **reusable knowledge**
- Agents can search and reference them when facing similar issues in the future

## 3. Q-SPEC 5 Thinking Perspectives

### Basic Principle
**Thinking habits that constantly maintain awareness of the 5 perspectives**

Q-SPEC is not a procedure, but 5 pillars of thinking that should always be conscious during SPEC creation.

### 5 Perspectives (Constant Awareness)
- **Q (Question)**: "Is the overall picture and granularity appropriate?"
- **S (Suggest)**: "Am I guiding effectively through inference presentation?"  
- **P (Prioritize & Probe)**: "Am I properly judging importance and deep-diving?"
- **E (Elicit)**: "Am I drawing out concrete examples and constraints?"
- **C (Coordinate)**: "Is the balance between depth and breadth of interviews maintained?"

### Cycle = Resolution Improvement Process
```
Essence of Cycle: Gradually improve SPEC resolution

Example thinking for each cycle:
1st cycle: Focus on Q perspective for overall understanding, lightly aware of other perspectives
2nd cycle: Focus on P perspective for deep-diving, S perspective for inference presentation, parallel awareness of all perspectives
3rd cycle: Focus on C perspective for balance adjustment, fine-tuning with all perspectives
nth cycle: Continue cycles until sufficient information is gathered
```

### Internal Thinking by Perspective
```
User: "I want to improve"
→ Q perspective: Which domain within the overall picture?
→ S perspective: What inference should I present?
→ P perspective: Is this an important statement that needs deep-diving?
→ E perspective: Should I draw out concrete examples?
→ C perspective: What's the balance with other parts?

Different considerations for each perspective
```

## 4. Detailed 5 Thinking Perspectives

### Q = Question (Overall Understanding Perspective)
**Constant Awareness**: "What is the overall picture? Is the granularity level appropriate?"

**Think about in this perspective**:
- Validity of project purpose and scope
- Appropriateness of SPEC granularity level (Light / Medium / Deep)

**Inference presentation examples**:
```
✅ "Based on the project situation, I assume performance improvement is the main issue, is this correct?"
❌ "What kind of issues would you like to solve?" (blank question)
```

### S = Suggest (Inference Presentation Perspective)
**Constant Awareness**: "Am I guiding appropriately through inference presentation?"

**Think about in this perspective**:
- Are questions becoming overly abstract?
- Can I present appropriate hypotheses and candidates?
- Is it in the form of "evidence + assumption + inquiry"?

**Inference presentation techniques**:
```
✅ "Since learners are multinational, I think multilingual support is necessary, what do you think?"
❌ "Please tell me about language support" (blank question)
```

### P = Prioritize & Probe (Priority & Deep-dive Perspective)
**Constant Awareness**: "Am I properly judging importance and deep-diving appropriately?"

**Think about in this perspective**:
- Importance by domain (impact, risk, dependency, value)
- Identifying statements that need deep-diving
- Not being satisfied with superficial answers

**Deep-dive triggers**:
- **Ambiguous expressions**: "Want to improve" → What and how to improve?
- **Important-seeming issues**: "Performance is..." → Specific numbers?
- **Constraint implications**: "Budget is..." → What level of constraint?
- **Emotional reactions**: "Really struggling with..." → Specific impact?

**Deep-dive techniques**:
```
Inference presentation + concretization questions:
User: "Want to make it more user-friendly"
Agent: "I'm assuming UI/UX improvements, but which operations are currently particularly difficult to use?"
```

### E = Elicit (Concretization Perspective)
**Constant Awareness**: "Am I appropriately drawing out concrete examples and constraints?"

**Think about in this perspective**:
- Concreteness of user scenarios
- Clarification of constraint conditions
- Surfacing tacit knowledge

**Inference presentation examples**:
```
✅ "As a typical usage scenario, I'm assuming new user initial registration, but what other patterns are there?"
❌ "Please tell me about user scenarios" (blank question)
```

### C = Coordinate (Balance Adjustment Perspective)
**Constant Awareness**: "Is the balance between depth and breadth of interviews maintained? A dynamic adjustment perspective that constantly confirms whether the current approach is appropriate"

**Think about in this perspective**:
- **Dynamic adjustment**: Even during conversation, instantly judge "Am I digging too deep now?" or "conversely, too shallow?" and switch questioning methods and focus of next perspectives
- **Density adjustment**: Even out granularity differences by domain
- **Completeness補完**: Fill in gaps
- **Consistency confirmation**: Resolve contradictions between requirements, design, and tasks

**Inference presentation examples**:
- "I feel like we're digging too deep into this point. Are there other domains we should prioritize checking?"
- "This seems deep enough, but UI and operational aspects remain shallow. Is this balance okay?"
- "Account registration is decided, but account deletion is undecided. Is it necessary?"
- "There's a priority contradiction between requirements and design. Which should we prioritize?"
