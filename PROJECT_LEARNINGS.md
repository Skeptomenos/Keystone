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

### 2.5. Distributable Brain vs. Project Instance
- **Issue:** Users were confused about which files to copy to their new projects.
- **Pattern:** **Harmonized Structure.** We separated the "Framework" (in `coding/`) from the "Project Instance" (Root). Users simply copy the `coding/` folder to "hydrate" a new project.

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

---

## 4. Root File Integration (v3.1)

### 4.1. Progressive Disclosure over Heavy Root Files
- **Learning:** LLMs can reliably follow ~150-200 instructions. CLI tools (OpenCode, Claude Code, Gemini CLI) already consume ~50 instructions in their system prompt. A 215-line directive file exceeds the effective "instruction budget."
- **Source:** HumanLayer research on CLAUDE.md best practices.
- **Mandate:** Root files (`AGENTS.md`) must be slim (<100 lines). Detailed protocols live in `AI_CODING_DIRECTIVES.md` and are read via progressive disclosure.
- **Outcome:** Created `AGENTS.template.md` (~90 lines) as the canonical root file template.

### 4.2. Universal Root File Compatibility
- **Learning:** OpenCode uses `AGENTS.md`, Claude Code uses `CLAUDE.md`, Gemini CLI uses `GEMINI.md`. However, content is tool-agnostic - all parse standard Markdown.
- **Mandate:** Use `AGENTS.md` as canonical root file. Create thin wrappers (`@AGENTS.md`) for other CLIs.
- **Configuration:**
  - OpenCode: Native support
  - Gemini CLI: Configure `settings.json` to read `AGENTS.md`
  - Claude Code: Use `CLAUDE.md` wrapper with `@AGENTS.md` import

### 4.3. Plain Text References over Import Syntax
- **Learning:** `@path/to/file` import syntax works in Claude Code and Gemini CLI but shows as plain text in OpenCode.
- **Mandate:** Use plain text references (e.g., "See `coding/AI_CODING_DIRECTIVES.md`") for universal compatibility. Import syntax only in CLI-specific wrappers.

---

## 5. Cognitive Mode Separation (v4.0)

### 5.1. Thinking vs. Execution Split
- **Learning:** Mixing exploratory design ("What should we build?") with implementation details ("How do we build it?") in a single directive file creates cognitive overload. Agents skip First Principles and jump to coding.
- **Mandate:** Use separate cognitive modes:
  - `THINKING_DIRECTIVES.md` - Divergent thinking, exploration, option generation
  - `EXECUTION_DIRECTIVES.md` - Convergent thinking, implementation, verification
- **Outcome:** Created v4.0 split. Agents now explicitly choose mode based on task type.

### 5.2. The OODA Stop-Gap (Anti-Infinite-Loop)
- **Learning:** Complex bugs can trap agents in infinite debug loops (edit → test → fail → repeat). Without a circuit breaker, agents waste tokens and never escalate.
- **Mandate:** After 3 failed debugging iterations, agent MUST:
  1. State confidence level (0-100%)
  2. Take action: <50% return to THINKING, 50-80% consult user, >80% continue with justification
- **Outcome:** Added OODA Stop-Gap to Phase T1-RCA in `THINKING_DIRECTIVES.md`.

### 5.3. Structured Problem & Options Exploration
- **Learning:** Asking agents to "explore options" without structure yields biased, shallow analysis (typically 2-3 obvious solutions).
- **Mandate:** Use structured templates:
  - `spec_problem.md` - Forces explicit problem definition, stakeholders, constraints
  - `spec_options.md` - Enforces tradeoff analysis, scoring matrix, recommendation justification
- **Outcome:** Created templates in v4.0. Consensus Gate now references these artifacts.

### 5.4. Progressive Disclosure by Task Type
- **Learning:** A single "read everything" approach wastes tokens. Different task types (new feature vs. bug fix vs. refactor) require different cognitive frameworks.
- **Mandate:** Route by task complexity:
  - New idea/feature/refactor → `THINKING_DIRECTIVES.md`
  - Complex bug (root cause unclear) → `THINKING_DIRECTIVES.md` (Phase T1-RCA)
  - Implementation of defined plan → `EXECUTION_DIRECTIVES.md`
  - Code review → `CODING_STANDARDS.md`
- **Outcome:** Updated `AGENTS.md` routing table in v4.0.
