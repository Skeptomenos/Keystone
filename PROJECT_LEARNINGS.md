# Project Learnings & Mandates

This document tracks the architectural and procedural evolution of the project. It serves as the "Corporate Memory" to prevent regression and guide future development.

---

## 1. Core Principles (Invariants)

### 1.1. The "Relay Race" Model
- **Learning:** LLM sessions are ephemeral and prone to amnesia. Treating each prompt as an isolated event leads to fragmented code and lost context.
- **Mandate:** Development must be treated as a relay race. State MUST be persisted in `.context/active_state.md` and passed via `.context/handover.md`.
- **Outcome:** We shifted from ephemeral logs (v1) to persistent, stateful context files (v2).

### 1.2. First Principles over Frameworks
- **Learning:** Asking an LLM to "Architect a Solution" often results in bloated, framework-heavy monoliths because it mimics average internet tutorials.
- **Mandate:** We must enforce **Recursive Decomposition**. Problems must be broken down into "Atomic Units" (Pure Logic) before any orchestration code is written.
- **Outcome:** We moved from generic "Design" directives (v1) to a strict "Decomposition Algorithm" (v2).

### 1.3. Documentation as a Blocking Gate
- **Learning:** Documentation updates that are optional or "suggested" are never done. Docs rot immediately.
- **Mandate:** Documentation updates (`CHANGELOG`, `DECISION_LOG`) and Learning Synthesis must be part of the **Definition of Done**.
- **Outcome:** The "Epilogue Protocol" was created. An agent cannot claim a task is finished until it proves the docs are synced.

### 1.4. Non-Destructive Documentation
- **Learning:** AI Agents tend to summarize or rewrite files from scratch, accidentally deleting valuable historical context.
- **Mandate:** Updates to Documentation (README, Specs) must be **Additive**. Never delete or truncate existing sections without explicit instruction.
- **Outcome:** The "Preservation of Knowledge Rule" was added to Phase 1.5.

### 1.5. Pragmatic Spec-Driven Development
- **Learning:** Strict "Chain of Custody" (Product -> Req -> Task -> Code) creates bureaucracy that slows down "Senior Engineer" agents.
- **Mandate:** Specs are Anchors, not Chains. We use **Inlined Constraints** (copying constraints to `tasks.md`) rather than rigid ID linking.
- **Outcome:** Adopted "Pragmatic SDD" in v3. Specs are "Just-in-Time" context injectors.

---

## 2. Tactical Patterns (The "How")

### 2.1. The "Zombie State" Prevention
- **Issue:** Stale state files caused LLMs to resume finished tasks.
- **Pattern:** The **Intent Check**. Phase 0.1 now explicitly requires comparing the user's current prompt with the stored `Objective`. If they mismatch -> Archive and Reset.

### 2.2. The "Ad-Hoc" Escape Hatch
- **Issue:** The heavy v2 process was too slow for simple questions ("List files in S3").
- **Pattern:** A strict **Complexity Threshold**. If a task is < 50 lines or read-only, skip the bureaucratic phases (0-4) and act immediately.

### 2.3. The "Inlined" Template
- **Issue:** Relying on external template files caused "File Not Found" errors on the first run.
- **Pattern:** **Zero-Dependency Directives.** The markdown structure for state files is now embedded directly in the directive text.

### 2.4. Single Source of Truth for Tasks
- **Issue:** Duplicating task lists in `active_state.md` and `tasks.md` created "Split Brain" and wasted tokens.
- **Pattern:** **No Duplication.** `tasks.md` is the sole owner of execution status (`[ ]` vs `[x]`). `active_state.md` tracks high-level Phase and Learnings only.

---

## 3. Anti-Patterns (What Failed)

### 3.1. "Update After Every Step"
- **Failure:** Requiring a state update after every micro-step doubled the latency and token cost.
- **Fix:** Relaxed to "Update after every **Logical Block**."

### 3.2. Passive Learning
- **Failure:** "Read the learnings file" resulted in token waste without comprehension.
- **Fix:** **Active Synthesis.** The agent must now explicitly *list* the constraints it is applying to the current task in its state file.

### 3.3. Ephemeral Logs
- **Failure:** Creating a unique log file for every task (`logs/task_123.md`) created a "Graveyard of Context" that no future agent ever read.
- **Fix:** **Archival Rotation.** We use one "Hot" file (`active_state.md`) for focus, and move it to "Cold" storage (`history/`) only when done.
