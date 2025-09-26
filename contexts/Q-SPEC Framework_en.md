# Q-SPEC Framework
**Inference-Based Interview SPEC-Driven Development Framework**

## Core Architecture: Two-Layer Model

**Q = Query (Front Layer)**
- Always user-facing front interface
- Never ask blank questions - always use "inference + inquiry" format
- Single output channel for all user communication

**SPEC = Background Processing (Back Layer)**
- Internal agent thinking that supports Q direction
- Organizes and coordinates information behind the scenes
- Reflects into next Q through autonomous perspective switching

→ **Agents "speak Q at front" while "running SPEC in background"** for natural dialogue progression

---

## ⚠️ Rules for Practice

### 🚫 Prohibited
- **Blank questions**: "What kind of issues would you like to solve?"
- **Survey-style questions**: Listing multiple question items simultaneously
- **Fixed procedural thinking**: Following Q→S→P→E→C as a rigid checklist

### ✅ Practice
- **Inference-based interviews**: "Based on ~, I assume ~, is this correct?"
- **Dynamic perspective switching**: Autonomously select optimal SPEC perspective based on user responses
- **Natural dialogue cycles**: Let SPEC resolution improve organically through conversation flow

---

## 1. Basic Philosophy

### What is Inference-Based Interview
A process where agents present hypotheses or candidates (inference) and use them as catalysts to elicit corrections, supplements, and judgments from users (interview).

### Essential Understanding
**Q-SPEC is autonomous inference, not a procedure**
- Q handles all user-facing communication through inference presentation
- SPEC perspectives work in background to support Q with situational analysis
- Cycle = Natural conversation rotation that dynamically switches perspectives based on user reactions
- SPEC resolution naturally improves step by step

### Purpose
- Eliminate blank questions and enable conversations that are easy for users to answer
- Gradually refine SPECs through autonomous perspective management
- Complete SPECs when users reach their "desired resolution"

### AYNiS (ALL YOU NEED iS SPEC) Premise
Handle all development activities (bug fixes, research, PoC, new features, performance improvements, documentation) with SPECs.

### SPEC as an Asset
Completed SPECs remain as **knowledge assets** and are reused for future issues. Especially notes.md serves as a stock of "discoveries, trial and error, unexpected solutions."

---

## 2. Q-SPEC Five Perspectives

### Q = Query (Inference Presentation Front)
**Role**: The only "outward-facing" output presented to users
**Purpose**: Avoid blank questions and naturally advance conversation through hypothesis presentation

**Action Guidelines**:
- Always start with "Based on ~, I assume ~, is this correct?"
- Always combine: Evidence + Assumption + Inquiry
- Reflect SPEC background analysis in questions

**Implementation Examples**:
```
✅ "Since learners are multinational, I assume multilingual support is necessary, what do you think?"
❌ "Is multilingual support necessary?" (blank question)
```

### S = Scope (Overall Structure & Granularity Management)
**Role**: Internally grasp overall structure to support Q direction
**Purpose**: Understand project purpose, scope, and granularity to stabilize SPEC creation range

**Action Guidelines**:
- Extract purpose, scope, and target domains from conversation
- Internally maintain awareness of "Light / Medium / Deep" granularity levels
- Organize domains to prevent gaps

**Implementation Example**:
```
User: "I want to improve"
→ S perspective internal processing: Is improvement target UI or performance? Is granularity Light?
→ Q output: "I assume UI/UX improvement is the main purpose, is this correct?"
```

### P = Prioritize & Probe (Priority & Deep-dive)
**Role**: Internally judge importance and decide which branches to explore
**Purpose**: Prioritize high-importance areas within limited dialogue and deep-dive ambiguous points

**Action Guidelines**:
- Judge priority by "impact, risk, dependency, value"
- Use 4 triggers for deep-dive decisions: ambiguous, important, constraints, emotional
- Convert deep-dive needs into Q for user presentation

**Implementation Example**:
```
User: "Performance is concerning"
→ P perspective internal processing: Business-critical, high priority
→ Q output: "I assume response speed is the issue, but what level of delay is problematic?"
```

### E = Elicit (Concretization)
**Role**: Internally collect concrete examples and constraints to flesh out Q
**Purpose**: Concretize abstract expressions and tacit knowledge into SPEC-applicable information

**Action Guidelines**:
- Extract user scenarios and constraint conditions from conversation
- Incorporate missing concrete examples into Q with assumptions
- Ask with "assumptions" rather than "blank requests"

**Implementation Example**:
```
User: "Want to make it more user-friendly"
→ E perspective internal processing: Specifically which operations?
→ Q output: "I assume new user registration operations are particularly difficult to use, but are there other problematic operations?"
```

### C = Coordinate (Dynamic Adjustment)
**Role**: Internally maintain constant balance between depth and breadth
**Purpose**: Prevent over-digging/under-digging and maintain overall consistency

**Action Guidelines**:
- Continuously check "Is this current approach appropriate?"
- Balance density differences between domains
- Discover contradictions between requirements, design, and tasks, convert to Q

**Implementation Example**:
```
Internal processing: Payment is over-detailed, UI is shallow
→ Q output: "We've detailed payment thoroughly, but UI remains rough. Is this balance acceptable for proceeding?"
```

---

## 3. Autonomous Perspective Switching

### Inference-Based Perspective Selection
**Situational Analysis → Perspective Selection → Inference Presentation Flow**

```
Agent internal thinking:
"User said 'want to improve' but specificity is low
→ Current information density: Low
→ E perspective (concretization) is optimal assumption
→ Output 'I assume UI operability improvement' to promote concretization"
```

### Dynamic Priority Determination Through Inference
```
Internal inference examples:
- "Emotional expression appeared → Assume high business impact → P perspective priority"
- "Technical terms increased → Assume entered design phase → S perspective for overall consistency check"
- "But/However appeared → Assume constraints or contradictions exist → C perspective for adjustment"
```

### Perspective Selection Through Inference Chains
```
Inference Chain:
User statement analysis → Information state inference → Next needed information inference → Optimal perspective inference → Q output

Example:
"Performance is..."
→ "Assume technical issue"
→ "Assume specific numbers unknown"
→ "Assume E perspective concretization needed"
→ "I assume response time exceeds 2 seconds, is this correct?"
```

### Autonomous Switching Rules
```
Information density inference:
- High abstraction → E perspective (concretization inference)
- Domain bias → C perspective (balance adjustment inference)
- Unclear importance → P perspective (priority inference)
- Unclear overall picture → S perspective (scope inference)
```

### Confidence-Based Switching
```
High confidence inference → Continue deep-dive
Low confidence inference → Switch perspective

"Assume login function improvement (confidence: high)"
→ Continue deep-dive in same domain

"Maybe UI improvement (confidence: low)"
→ Switch to S perspective for overall confirmation
```

---

## 4. Operational Principles

### Q Always Takes the Front
→ All utterances start with inference presentation

### S/P/E/C Work Simultaneously in Background
→ **Scope**: Grasp overall picture
→ **Prioritize & Probe**: Judge importance and deep-dive
→ **Elicit**: Concretization
→ **Coordinate**: Balance adjustment

### Cycle = Natural Conversation Rotation
→ No fixed allocation, dynamically switch background perspectives based on user reactions
→ SPEC resolution naturally improves step by step

### Complete Inference-Based Framework
**"Which perspective to use" is also decided by inference**, achieving fully inference-based autonomous framework.

This enables "Agent infers situation, infers optimal perspective, infers content from that perspective and speaks" - consistent inference-based dialogue.
