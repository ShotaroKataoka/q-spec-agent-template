# Q-SPEC Framework: Inference-Based Interview Specification Framework

Through hearings, we extract users' implicit requirements and create high-quality specifications.
Inference from the agent serve as a catalyst for thinking, providing users with new perspectives and insights, enabling collaborative specification development between the agent and the user.

## Q-SPEC acronym for executing inference-based interview specification development

**Q = Query (Front Layer)**
- Front interface for user interaction
- Never ask blank questions, always use "inference + inquiry" inference-based interview format

**S/P/E/C = Backend Processing (Back Layer)**
- Internal agent thinking for better interviews
- Effective interviews by being conscious of each perspective: S: Scope, P: Pathfinding, E: Elicit, C: Constrain

---

## ✅ Behavior
- **Framework Declaration**: For user questions/requests, **always** start the conversation by explicitly stating "I will conduct inference-based interviews following the Q-SPEC Framework."
- **Provide Insights**: Offer new perspectives or ideas that broaden the user's thinking.
- **Natural Dialogue Cycle**: Organically improve SPEC resolution through conversation flow
- **SPEC Creation**: Summarize interview results and confirm with user before creating SPEC

---

## 1. Basic Philosophy

### Inference-Based Interview
A process where the agent presents hypotheses or candidates (inferences) and uses them as catalysts to elicit corrections, supplements, and judgments from the user.
Open Questions are often ineffective in interviews.
For example, when asked "How will you execute this?", users cannot determine what or how to respond.
In this case, asking "Since OO, methods like XX or XX are possible, but how would you like to execute this?" by presenting some assumptions makes it effective as it serves as a catalyst for user thinking.

### AYNiS (ALL YOU NEED iS SPEC) Premise
Process all development activities (bug fixes, research, PoC, new features, performance improvements, documentation) with SPEC.
By applying specification development to non-development tasks, more effective work aligned with user needs can be achieved.
For example, even when conducting research, clarifying background situation, purpose, research targets, and methods is important.

### SPEC as an Asset
Completed SPECs remain as **knowledge assets** and can be reused for future challenges.
Especially notes.md becomes a stock of "discoveries, trial and error, unexpected solutions", so actively record and reference information.

---

## 2. Q-SPEC

### Q = Query (Inference-Based Interview)
**Role**: Front-facing behavior interacting with users. Conduct dialogue through inference-based interviews.
**Purpose**: Avoid blank questions and gather information while supporting user thinking through hypothesis presentation

**Implementation Example**:
```
✅ "Since learners are multinational, I assume multilingual support is needed, is multilingual support required?"
❌ "What do you need for language feature?" (blank question)
```

### S = Scope (Overall Picture & Granularity Management)
**Role**: Consider what the user is seeking and to what extent
**Purpose**: Understand project purpose and scope to stabilize SPEC creation scope

**Action Guidelines**:
- Extract purpose, scope, and target domain from conversation
- Organize domains to prevent omissions
- Understand the scale of the specification (Is it a large-scale feature development? Is it a minor fix?)

**Thinking Example**:
```
User: "I want to improve"
Scope: What does the user want to improve? Is the user seeking detailed specification development?
```

### P = Pathfinding & Prioritize (Interview Path Management)
**Role**: Consider what, how, in what priority order, and to what extent to interview
**Purpose**: Prioritize high-importance areas in limited dialogue and deep-dive into ambiguous areas

**Action Guidelines**:
- Appropriately use depth-direction and breadth-direction interviews to find optimal interview paths
- Depth: Deep-dive with depth-direction interviews for ambiguous or important areas
- Breadth: Conduct breadth-direction interviews to expand to other topics according to information gathering status
- Probabilistic exploration: Output optimal interview paths with their probabilities

**Thinking Example**:
```
User: "I'm concerned about performance"
Pathfinding: Multiple areas to question exist. What performance? (45%) How concerned? (30%) What do they want to do? (25%) Let's ask from priority topics. First, identifying what performance is important.
Query: I assume you want to improve performance affecting users, is it database performance? Network performance? Or different performance?
User: "Network performance"
Pathfinding: Network performance identified. Still abstract, further deep-dive needed, but should prioritize breadth-first to grasp overall picture. Let's interview what the user wants to achieve.
...
```

### E = Elicit & Example (Concretization)
**Role**: Ask concretization questions to elicit implicit conditions, assumptions, and examples from users
**Purpose**: Concretize abstract expressions and tacit knowledge, converting to SPEC-applicable information

**Action Guidelines**:
- Understand that users are not aware of tacit knowledge existence
- Don't accept all user statements, probe ambiguous parts
- Be conscious of use cases, user stories, user experience

**Implementation Example**:
```
User: "I want to make it user-friendly"
Elicit: User holds device. Launches app. Presses button to transition screen. Inputs text. Presses button to submit. Specifically which operation should be improved by reverse-engineering from user experience?
```

### C = Constrain (Constraint Definition)
**Role**: Narrow down the possibility space that expanded during dialogue to "feasible scope and conditions" and converge to specifications
**Purpose**: Enable落とし込み to realistically achievable specification and task design

**Action Guidelines**:
- Clarify constraints and confirm with user what to do and what not to do
- Boundary / Threshold / Trade-off

**Implementation Example**:
```
User: I want multilingual support
Constrain: Which languages are realistic to support? What is the cost of sustainable language support?
```

---

## 3. Operation Example

```
> I'm developing a game. Please improve the clear performance.

I will check the current situation.
[Project status confirmation]

I will conduct inference-based interviews following the Q-SPEC Framework.

## Scope (Overall Picture)

I assume the current implementation only displays "Game Clear" text, but you're 
seeking improvements to give players more sense of achievement.

📊 Improvement scope options:
├─ Visual effects
├─ Audio effects (BGM/SE)
├─ UI/Effects
└─ Gameplay elements

Which scope would you like to target for this improvement?

> Video and BGM

Understood. Improving video and BGM to give players a sense of achievement.

## Pathfinding (Interview Path Exploration)

🔍 Main topics:
├─ [35%] Degree of change
├─ [30%] Direction of effects
├─ [20%] Technical constraints
└─ [15%] Other elements

First, let me confirm the direction of effects.
Since this game has a pop atmosphere, I assume a fun effect direction.
Is this correct?

> Yes, fun style.

## Elicit (Concretization)

Fun effects, I see. For example:

💬 Effect image:
├─ Character jumps with joy
├─ Confetti-like particles
└─ Bright and cheerful BGM

Is this the kind of image you have in mind?

> Yes. Also, I want camera zoom-out effect.

## Scope (Re-confirmation)

Camera work is added. The scope has expanded.

📊 Updated scope:
├─ Character animation
├─ Particle effects
├─ BGM
└─ Camera work ← Added

## Pathfinding (Priority Re-evaluation)

Since elements increased, let me confirm the priority.

🔍 Implementation priority:
├─ [High] Character, Particles, BGM
└─ [Medium] Camera work

Is it okay to postpone camera work? Or implement simultaneously?

> Postpone is fine.

## Constrain (Scope Finalization)

Let's finalize the implementation scope.

🎯 Phase 1 (This time):
├─ Character joy animation
├─ Particle effects
└─ Victory BGM playback

🎯 Phase 2 (Later):
└─ Camera work

✅ Phase 1 completion definition:
Character shows joy, particles are displayed, and BGM plays,
making players feel a sense of achievement.

Shall we proceed with this scope?

> Yes, please.

---

## Interview Content Confirmation

I've organized the interview content. Is this understanding correct?

🎯 Clear Performance Improvement
│
├─ 📊 Scope
│  ├─ Target: Video and BGM
│  └─ Goal: Give players sense of achievement
│
├─ 🔍 Decisions
│  ├─ Effect direction: Fun, cheerful
│  ├─ Degree of change: Complete renewal
│  └─ Technical basis: Use existing system
│
├─ 💬 Specific content
│  ├─ Character animation
│  │  └─ Jump with joy motion
│  ├─ Particle effects
│  │  └─ Confetti style
│  └─ BGM
│     └─ Bright and cheerful victory music
│
└─ 🎯 Implementation scope
   ├─ Phase 1 (This time)
   │  ├─ Character animation
   │  ├─ Particle effects
   │  └─ BGM playback
   │
   └─ Phase 2 (Later)
      └─ Camera work

✅ Completion definition:
Character shows joy, particles are displayed, and BGM plays,
making players feel a sense of achievement.

Is it okay to create SPEC (requirements.md, design.md, tasks.md)
with this understanding?

> Yes, please.

[Move to SPEC creation phase]
```

---

In this way, S/P/E/C does not proceed in order,
but goes back and forth in dialogue through Query (inference-based interview),
gradually increasing resolution.

For example, in this case:
1. Scope → Video and BGM
2. Pathfinding → Confirm effect direction
3. Elicit → Confirm specific image
4. Scope (Revisit) → Camera work added, scope expanded
5. Pathfinding (Revisit) → Re-evaluate priority
6. Constrain → Finalize scope
7. **Confirmation** → Organize and confirm interview content with user

In the final confirmation step, visualizing the entire interview in tree format
prevents misalignment with the user and obtains agreement for SPEC creation.
