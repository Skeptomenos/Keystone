# Hybrid Thinking Directives (First Principles & Structured Analysis)

> **Protocol Version:** 4.4

> **PROGRESSIVE DISCLOSURE:**
> This file guides problem decomposition BEFORE implementation using a hybrid approach that combines first-principles thinking with structured six-question analysis.
> The root file (`AGENTS.md`) references this file for thinking tasks.
> Read this when:
> - Starting a new project or feature
> - Undertaking a major refactor
> - Facing a complex bug with unclear root cause
> - Assumptions have proven wrong during execution
> - Making high-risk technical or business decisions

> **SIX CORE QUESTIONS FRAMEWORK:**
> 1. What are we actually trying to achieve?
> 2. What are the fundamental components?
> 3. What assumptions are we making?
> 4. How can we validate each assumption?
> 5. What's the confidence level for each part?
> 6. What are the risks?

---

## When to Use This File

| Scenario | Action |
|----------|--------|
| New app idea / greenfield project | Full process (Phase 1 → 2 → 3 → 4) |
| New feature design | Full process (Phase 1 → 2 → 3 → 4) |
| Major refactor | Phases 1 and 3 (Focus on fundamentals and risks) |
| Complex bug (root cause unclear) | Phase T1-RCA only |
| Returning from failed execution | Phase 1 (reassess fundamentals) |
| High-risk technical decision | Phases 1, 2, 3 (Skip user empathy if clear) |
| Requirement validation | Phases 2-3 (Focus on assumptions and risks) |

---

## Phase Overview

```
┌─────────────────────────────────────────────────────────────────┐
│  HYBRID THINKING: Fundamentals → Assumptions → Options → Handoff │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Phase 1: Fundamentals ──→ Phase 2: Assumptions ──→ Phase 3: Risk & Options ──→ EXECUTION
│         │                              │                              │              │
│         └──→ T1-RCA (Complex Bugs) ─────┴──→ Validation & Consensus ─────┘              │
│                                                                 │
│  T-RFL (Reflect) ←── Called from EXECUTION Phase 4 (Epilogue)  │
└─────────────────────────────────────────────────────────────────┘
```

## The Six Core Questions

This hybrid approach integrates six fundamental questions throughout the phases:

1. **What are we actually trying to achieve?** (User + System goals)
2. **What are the fundamental components?** (Entities + Interactions)  
3. **What assumptions are we making?** (Explicit identification)
4. **How can we validate each assumption?** (Testability planning)
5. **What's the confidence level for each part?** (Quantified uncertainty)
6. **What are the risks?** (Structured assessment)

---

## Phase 1: Fundamentals (First Principles)

> **Goal:** Strip the problem to its fundamental truths before building anything.
> 
> **Core Questions Addressed:** Q1 (Objectives), Q2 (Components), Q6 (Constraints)

### 1.1: Define Objectives & Components

Ask these questions explicitly:

1. **What are we actually trying to achieve?** (Q1)
   - **User Goal:** What is the USER actually trying to accomplish? (Not what they asked for, but their underlying goal)
   - **System Goal:** What must the system accomplish to enable the user goal?
   - **Success Criteria:** What would success look like from each perspective?

2. **What are the fundamental components?** (Q2)
   - **Core Entities (Nouns):** What are the fundamental "things" in this domain?
   - **Entity Properties:** What properties do they have?
   - **Entity Relationships:** How do they relate to each other?
   - **Core Interactions (Verbs):** What actions can be performed between entities?
   - **Interaction Triggers:** What triggers these actions?
   - **Interaction Outcomes:** What are the outcomes?

3. **What are the constraints?** (Part of Q6)
   - **Physical Constraints:** What cannot be changed (technical, business, legal)?
   - **Hard Limits:** What are the absolute boundaries?
   - **Trade-off Tensions:** What inherent tensions exist (speed vs accuracy, flexibility vs simplicity)?

### 1.2: Identify Fundamental Truths

Document the core "physics" of the problem:

- **Invariants:** What must ALWAYS be true in any valid solution?
- **Failure Modes:** What would break if we got this wrong?
- **Success Dependencies:** What must work for the solution to succeed?

> **THE ELIMINATION TEST (Required before Phase 2):**
> 1. **Who requested this?** Name a person, not a department. If "assumed"—challenge it.
> 2. **What can be removed entirely?** Not simplified—removed. If nothing, you haven't pushed hard enough.
> 3. **Ruthless prioritization:** What is the MINIMAL problem worth solving? Everything else is cut until proven essential.

**Output:** Document findings in `keystone/specs/problem.md` using the template.

---

## Phase T1-RCA: Root Cause Analysis (For Complex Bugs)

> **Use when:** Bug is not obviously locatable, has returned after "fixes", spans multiple modules, or defies initial assumptions.

### T1-RCA.1: Define Expected vs Actual

| Aspect | Expected | Actual |
|--------|----------|--------|
| Behavior | [What SHOULD happen] | [What IS happening] |
| Data | [Expected values] | [Observed values] |
| Timing | [When it should occur] | [When it occurs] |

- **When did this start?** Isolate the change window.
- **Is it reproducible?** Under what conditions?

### T1-RCA.2: Trace the Data Path

Map the flow explicitly:

```
INPUT → [Transform 1] → [Transform 2] → ... → OUTPUT
         ↑                ↑
         Where could the contract be violated?
```

- What is the INPUT to the system?
- What TRANSFORMATIONS occur?
- Where does the OUTPUT diverge from expectation?

### T1-RCA.3: Challenge the Obvious

Ask explicitly:

- **Is the error message telling the truth?**
  - Error in Module A might be caused by Module B
  
- **Is this really a bug, or a misunderstanding?**
  - Could the behavior be "correct" per the actual (not assumed) spec?

- **Could this be caused by something UPSTREAM?**
  - Bad data? Race condition? External dependency?

### T1-RCA.4: Formulate Root Cause Hypothesis

State explicitly:

- **Hypothesis:** "The root cause is [X] because [evidence]"
- **Evidence FOR:** What supports this hypothesis?
- **Evidence AGAINST:** What would disprove it?
- **Test:** How can we validate this hypothesis?

### T1-RCA.5: Decide on Approach

| Approach | When to Use |
|----------|-------------|
| Fix root cause | Preferred. Sustainable solution. |
| Fix symptom + document debt | Root cause fix is too risky right now. |
| Escalate to user | Architectural issue discovered. Needs decision. |

**Output:** Proceed to `keystone/directives/EXECUTION.md` with validated hypothesis.

---

## Phase 2: Assumption Analysis & Validation

> **Goal:** Identify, challenge, and validate all assumptions with confidence assessment.
> 
> **Core Questions Addressed:** Q3 (Assumptions), Q4 (Validation), Q5 (Confidence)

### 2.1: Identify All Assumptions (Q3)

Before proceeding, explicitly identify and challenge every assumption:

**User Assumptions:**
- **"Why does the user think they need this?"** Is there a simpler way to achieve their goal?
- **"What is the user's actual pain vs stated need?"**

**Technical Assumptions:**
- **"What existing solutions exist?"** Why aren't they sufficient? What can we learn?
- **"Are we copying patterns blindly?"** Is this solution based on first principles or analogy?
- **"What would we build with zero legacy constraints?"** Ignore what exists—what's ideal?

**Business Assumptions:**
- **"Is this worth building?"** What's the ROI? What's the opportunity cost?
- **"Who will maintain this?"** What are the long-term implications?

### 2.2: Validation Planning (Q4)

For EACH assumption, document:

```
Assumption: [Clear statement]
Validation Method: [How we'll test this - experiment, prototype, research, interview]
Success Criteria: [What outcome validates the assumption]
Time/Cost to Validate: [Effort required]
Risk if Wrong: [Consequences of this assumption being false]
```

**Validation Types:**
- **Experiments:** A/B tests, prototypes, spikes
- **Research:** Market analysis, technical deep dives
- **Interviews:** User feedback, stakeholder validation
- **Analysis:** Data review, competitive analysis

### 2.3: Confidence Assessment (Q5)

For each assumption and major decision, assign confidence levels:

```
Component: [Name]
Confidence: High (80-100%) | Medium (50-79%) | Low (0-49%)
Basis: [Evidence supporting this confidence]
Actions to Increase: [What would increase confidence?]
Minimum Confidence to Proceed: [Threshold before moving forward]
```

**Confidence Scoring Guide:**
- **High (80-100%):** Proven through validation or extensive data
- **Medium (50-79%):** Some evidence but needs more validation
- **Low (0-49%):** Primarily assumption, high uncertainty

### 2.4: Risk Identification (Part of Q6)

For each low-confidence assumption, identify:

```
Risk Type: Technical | User | Business | Timeline
Impact: High | Medium | Low  
Probability: High | Medium | Low
Mitigation Strategy: [How to reduce this risk]
Contingency Plan: [What if risk materializes]
```

**Output:** Document validated assumptions in `keystone/specs/problem.md` with confidence scores and validation plans.

---

## Phase 2-Optional: User Understanding (When Needed)

> **Use when:** User empathy is unclear or stakeholder alignment is needed
> 
> **Note:** This phase is only required when user understanding is the primary uncertainty

### 2-U.1: Empathize

Document explicitly:

- **Who is the user?** Role, context, technical level
- **What is their current pain?** How do they solve this today? What frustrates them?
- **What does success look like?** How will they know the problem is solved? What would delight them?

### 2-U.2: Define the Problem

Craft a clear problem statement:

> **[User]** needs a way to **[action]** so that **[outcome]**, but currently **[obstacle]**.

**Anti-Goals:** Explicitly state what we are NOT solving.

---

## Phase 3: Risk Assessment & Solution Exploration

> **Goal:** Generate options, evaluate risks comprehensively, and validate approach.
> 
> **Core Questions Addressed:** Q6 (Risks), plus solution generation

### 3.1: Comprehensive Risk Assessment (Q6)

Before exploring solutions, conduct thorough risk analysis:

**Technical Risks:**
- **Implementation Complexity:** Risk of underestimation
- **Technology Risk:** New/unproven technologies
- **Integration Risk:** Dependencies on external systems
- **Performance Risk:** Scaling, speed, resource usage
- **Security Risk:** Vulnerabilities, data protection

**User/Business Risks:**
- **Adoption Risk:** Users won't use it
- **Value Risk:** Doesn't solve real problem
- **Timing Risk:** Too early/too late to market
- **Resource Risk:** Insufficient team/budget/time
- **Maintainability Risk:** Future changes become difficult

**Risk Matrix for Each Option:**

```
Risk: [Clear description]
Category: Technical | User | Business
Impact: High (blocks success) | Medium (significant issues) | Low (minor inconvenience)
Probability: High (>70%) | Medium (30-70%) | Low (<30%)
Risk Score: Impact × Probability (1-9 scale)
Mitigation Strategy: [Specific actions to reduce risk]
Contingency Plan: [What to do if risk materializes]
Owner: [Who monitors this risk]
```

### 3.2: Generate Solution Options

Propose 2-3 different approaches:

**For each option, document:**
- **Description:** How would this work?
- **Pros:** What's good about it?
- **Cons:** What's problematic?
- **Complexity:** Low / Medium / High
- **Risk Profile:** [Summarize from risk matrix]
- **Confidence Level:** High/Medium/Low (from Phase 2)
- **Validation Plan:** How we'll validate this approach

**Rule:** Do not evaluate while generating. First diverge, then converge.

### 3.3: Evaluate Against Fundamentals & Constraints

For each option, systematically check:

**Problem Fit:**
- [ ] Does it solve the CORE problem (from Phase 1)?
- [ ] Does it meet user objectives (Q1)?
- [ ] Does it align with fundamental components (Q2)?

**Assumption Validation:**
- [ ] Does it honor validated assumptions (from Phase 2)?
- [ ] Does it meet minimum confidence thresholds?
- [ ] Are remaining risks acceptable?

**Constraint Compliance:**
- [ ] Does it respect CONSTRAINTS (technical, business)?
- [ ] Is it the SIMPLEST solution that works?
- [ ] Does it fit within resource limits?

**Risk-Benefit Analysis:**
```
Option: [Name]
Total Risk Score: [Sum of risk scores]
Expected Benefit: [Qualitative/quantitative]
Risk/Benefit Ratio: [Assessment]
```

### 3.4: Consensus Gate (CRITICAL)

**Before proceeding to execution:**

1. **Present Comprehensive Summary:**
   - Problem definition and objectives (Q1)
   - Key assumptions and confidence levels (Q3-Q5)
   - Options considered with risk profiles (Q6)
   - Recommended approach with justification
   - Trade-offs accepted and mitigations planned
   - Validation plan for chosen approach

2. **Risk Acknowledgment:**
   - "These are the key risks we're accepting: [list]"
   - "This is our plan to monitor and mitigate: [plan]"

3. **Ask explicitly:**
   > "Does this framing match your understanding? 
   > Are you comfortable with the risks we're accepting? 
   > Should we proceed with this approach?"

4. **STOP** and await confirmation.

**Output:** Document chosen option with risk assessment in `keystone/specs/options.md`.

---

## Phase 4: Validation & Handoff to Execution

> **Goal:** Validate approach comprehensively and hand off cleanly to execution phase.
> 
> **Core Questions Addressed:** Final validation of all 6 questions

### 4.1: Final Validation Checklist

Before handoff, validate all six core questions have been addressed:

**Q1: Objectives Validation**
- [ ] Clear understanding of what we're trying to achieve
- [ ] User goals documented and validated
- [ ] System goals aligned with user goals
- [ ] Success criteria defined and measurable

**Q2: Components Validation**
- [ ] Fundamental entities identified
- [ ] Core interactions mapped
- [ ] Relationships between components understood
- [ ] Constraints documented and respected

**Q3: Assumptions Validation**
- [ ] All assumptions explicitly identified
- [ ] Each assumption challenged and tested
- [ ] Stakeholder agreement on key assumptions
- [ ] False assumptions identified and addressed

**Q4: Validation Planning**
- [ ] Validation methods defined for each assumption
- [ ] Success criteria for validation established
- [ ] Resources allocated for validation activities
- [ ] Timeline for validation activities planned

**Q5: Confidence Assessment**
- [ ] Confidence levels assigned to all components
- [ ] Evidence supporting confidence levels documented
- [ ] Plans to increase low confidence areas defined
- [ ] Minimum confidence thresholds met

**Q6: Risk Management**
- [ ] All risks identified and assessed
- [ ] Risk mitigation strategies defined
- [ ] Contingency plans established
- [ ] Risk owners assigned and monitoring planned

### 4.2: Required Artifacts

Before coding, ensure these exist:
- `keystone/specs/problem.md` — Objectives, components, assumptions, validation plans
- `keystone/specs/options.md` — Chosen approach, risk assessment, confidence levels
- `keystone/specs/requirements.md` — EARS syntax specs with validation criteria
- `keystone/specs/tech.md` — Stack, constraints, risk mitigations

### 4.3: Task Generation with Risk Integration (AI-Assisted)

> **Purpose:** Generate tasks from requirements with integrated risk management and user approval.

**Process:**

1. **Extract Requirements:** Read `keystone/specs/requirements.md` and identify all "When... Then..." statements
2. **Assess Task Risks:** For each potential task, assess:
   - Technical complexity risk
   - Dependency risk
   - Confidence level of approach
3. **Generate Tasks:** Create one task per requirement or logical grouping
4. **Identify Dependencies:** Determine which tasks depend on others based on requirement relationships
5. **Assign Risk Mitigations:** Link tasks to risk mitigation strategies from Phase 3
6. **Assign Workstreams:** Group related tasks into workstreams if applicable
7. **Set Initial Status:** All new tasks start as `Backlog`
8. **Present for Approval:** Show generated task list with risk context

**Task Generation Template:**

```markdown
From REQ-XXX: "[requirement text]"

- [ ] **TASK-XXX:** [Derived task title]
    - **Dependencies:** [Identified dependencies or "None"]
    - **Risk Level:** High/Medium/Low
    - **Risk Mitigation:** [How this task addresses specific risks]
    - **Confidence:** High/Medium/Low
    - **Status:** Backlog
    - **Workstream:** [workstream-name or "main"]
    - **Context/Constraints:** From REQ-XXX: [key constraint]
    - **Validation Criteria:** [How we'll know this task succeeds]
```

9. **User Approval Required:**
   > "I've generated [N] tasks from the requirements with risk assessments. Here's the proposed task list:
   > [task list with risk context]
   > Does this breakdown look correct? Are the risk assessments appropriate? Should I adjust any tasks or dependencies?"

10. **STOP** and await user confirmation before writing to `keystone/specs/tasks.md`.

### 4.4: Final Validation Checklist

**Core Questions Validation:**
- [ ] **Q1 (Objectives):** All objectives clearly documented and measurable
- [ ] **Q2 (Components):** All components and interactions understood
- [ ] **Q3 (Assumptions):** All assumptions identified and challenged
- [ ] **Q4 (Validation):** Validation methods defined for critical assumptions
- [ ] **Q5 (Confidence):** Confidence levels assigned and acceptable
- [ ] **Q6 (Risks):** All risks identified with mitigation plans

**Process Validation:**
- [ ] Problem defined, assumptions validated, approach approved
- [ ] Specs created/updated with risk information
- [ ] Tasks generated and approved with risk context (see 4.3)
- [ ] All stakeholders aligned on approach and risks
- [ ] Ready for `keystone/directives/EXECUTION.md`

### 4.5: The Handshake (MANDATORY STOP)

> **CRITICAL:** You cannot transition from Thinking to Execution in the same response.
> 1. Summarize the complete plan including objectives, assumptions, confidence levels, and risks.
> 2. Present final validation of all six core questions.
> 3. Ask "Ready to proceed with implementation?"
> 4. **STOP.** Wait for the user's explicit "Go".

**Next:** Read `keystone/directives/EXECUTION.md` to begin implementation.

---

## Phase T-RFL: Reflection & Learning Synthesis

> **Use when:** Called from EXECUTION_DIRECTIVES Phase 4, after Phase 3 completion, or at session end. This is reflective thinking, not mechanical documentation.
> 
> **Core Questions Addressed:** Meta-reflection on all 6 questions' effectiveness

### T-RFL.1: Six-Question Review

Review how well the six core questions worked:

**Q1 (Objectives):**
- Did we correctly identify what we were trying to achieve?
- Were user/system goals well-defined?
- Did objectives change during execution?

**Q2 (Components):**
- Did our component analysis hold up?
- Were there missing components we discovered?
- Were component relationships correctly understood?

**Q3 (Assumptions):**
- Which assumptions proved correct/incorrect?
- Did we miss any critical assumptions?
- How effective was our assumption challenging?

**Q4 (Validation):**
- Did our validation methods work?
- Were validations completed before major decisions?
- What validation approaches were most effective?

**Q5 (Confidence):**
- Were our confidence levels accurate?
- Where did we over/under estimate confidence?
- How did confidence levels change with new information?

**Q6 (Risks):**
- Which risks materialized?
- Were our risk assessments accurate?
- What risks did we miss entirely?

### T-RFL.2: Session Review

- What was the objective? Was it achieved?
- What worked with the hybrid approach? What didn't?
- What was surprising or unexpected?
- How did the six-question framework improve decision-making?

### T-RFL.3: Pattern Extraction

Ask: "What ONE reusable insight emerged from this work about our thinking process?"

**Thinking Process Patterns:**
- **If effective pattern:** How can we apply this thinking approach to future work?
- **If anti-pattern:** What caused it in our methodology? How to prevent recurrence?

**Domain Patterns:**
- **If domain pattern:** How does this apply to similar problems?
- **If anti-pattern:** What domain-specific misunderstanding occurred?

**Output:** Add to `keystone/PROJECT_LEARNINGS.md` using format:
```
### X.X. [Title]
- **Learning:** [What we discovered about the problem or our thinking process]
- **Methodology Insight:** [What this teaches us about the 6-question approach]
- **Mandate:** [What to do/not do going forward]
- **Outcome:** [How this changes behavior and thinking]
```

### T-RFL.4: Decision Distillation

If any of these occurred, formulate an ADR for `keystone/DECISION_LOG.md`:

- Dependency added or removed
- Schema or data structure changed
- Pattern or approach deprecated
- Significant trade-off made (chose X over Y with consequences)
- Major assumption validated or invalidated
- Risk mitigation strategy implemented

Include in ADR:
- Which core questions were most/least effective
- Confidence level evolution
- Risk outcomes vs predictions

### T-RFL.5: Handover Synthesis

Distill for the next agent (`keystone/project/handover.md`):
- **Where are we?** (3 bullets max, including confidence levels and risk status)
- **What's next?** (Concrete next steps, including any pending validations)
- **Key Insights:** (Most important learnings from six-question process)
