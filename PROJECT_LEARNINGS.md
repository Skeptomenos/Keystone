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

---

## 6. Token Frugality & Compression (v4.1)

### 6.1. Directive Files Should Be Telegraphic Too
- **Learning:** We mandate telegraphic style for `.context/` files but wrote verbose directive files. Directive files are read at session start—token cost compounds across all sessions.
- **Mandate:** Apply compression to directive files:
  - Preserve enforcement keywords (MUST, CRITICAL, STOP, WAIT, Required)
  - Compress descriptive prose, keep command language intact
  - Use inline formats for lists where structure isn't critical
- **Outcome:** v4.1 reduced AGENTS.template.md by 44%, EXECUTION_DIRECTIVES by 14%.

### 6.2. High-Impact Compression over Uniform Compression
- **Learning:** Compressing all files equally yields diminishing returns. Root files (loaded every session) have higher leverage than detail files (loaded occasionally).
- **Mandate:** Prioritize compression by file frequency:
  1. Root file (`AGENTS.md`) — highest priority
  2. Execution directives — medium priority
  3. Thinking directives — low priority (complexity justifies verbosity)
- **Outcome:** Focused effort on AGENTS.template.md (44% reduction) vs. THINKING_DIRECTIVES (3% reduction).

### 6.3. Consolidate Related Rules (No Scatter)
- **Learning:** Operational Mandates (I/O Fortress, Clean Slate, Hybrid First, Preservation of Knowledge) were scattered in EXECUTION_DIRECTIVES Phase 1.5. Agents had to read execution directives to find coding reliability rules.
- **Mandate:** Group conceptually related rules in a single location. All "how to write reliable code" rules belong in CODING_STANDARDS.
- **Outcome:** Created Section 9 in CODING_STANDARDS.md. EXECUTION_DIRECTIVES now references it with one line.

### 6.4. Downside Review as Implementation Gate
- **Learning:** Proposing a plan and immediately implementing it skips risk analysis. Asking "What downsides have we missed?" before implementation surfaced 7 risks that would have caused rework.
- **Mandate:** Before implementing significant changes, explicitly enumerate downsides and mitigations. This is a gate, not optional reflection.
- **Outcome:** v4.1 compression was revised to keep Context Files table, move ALL mandates (not split), and preserve enforcement keywords.

### 6.5. Epilogue Requires Thinking, Not Just Documentation
- **Learning:** Treating Epilogue as mechanical cleanup ("update docs, archive state") led to shallow learnings and frequent user prompts to "Execute Epilogue."
- **Mandate:** Epilogue must include reflective thinking (T-RFL phase). Learning synthesis requires asking: What worked? What didn't? What surprised?
- **Outcome:** Added Phase T-RFL to THINKING_DIRECTIVES. Epilogue is now mandatory after feature/design completion.

---

## 7. Approval Gates for Eager Models (v4.2)

### 7.1. Explicit Implementation Gates Stop Premature Coding
- **Learning:** AI models (especially Gemini 2.5 Pro, sometimes Claude Opus) have strong "helpful completion" tendencies. After refining a plan, they immediately start coding without waiting for user approval.
- **Mandate:** Add explicit rule with emphatic formatting: "NO IMPLEMENTATION WITHOUT APPROVAL ⚠️ CRITICAL ⚠️". Models must ask "Ready to proceed?" and WAIT for explicit approval.
- **Outcome:** Added Golden Rule #6 to AGENTS.md with callout: "Models prone to eager execution: This means YOU."

### 7.2. Model-Specific Rules Are Not Feasible in Static Markdown
- **Learning:** Static markdown files cannot detect which AI model is reading them. Conditional rules based on model identity are not technically possible.
- **Mandate:** Use universal strict rules. Designing for the worst case (eager execution) works for all cases. The cost of over-constraining a capable model is lower than under-constraining an impulsive one.
- **Outcome:** Rejected model-specific rules in favor of emphatic universal constraints.

### 7.3. Redundancy is a Feature for Critical Constraints
- **Learning:** Important rules should appear in multiple files for defense-in-depth. If an eager model skips one checkpoint, it may catch another.
- **Mandate:** For critical constraints like implementation gates, place in AGENTS.md (entry point), THINKING.md (end of design), and EXECUTION.md (pre-implementation). Use slightly different wording to avoid being filtered as repetition.
- **Outcome:** Implemented gates in THINKING.md (T4.3 Handshake) and EXECUTION.md (Pre-Flight Gate) in v4.2.

### 7.4. The "Handshake Rule" Kills Momentum Bias
- **Learning:** Even with approval gates, models often treat "Plan Updated" as implicit permission to continue ("Momentum Bias").
- **Mandate:** Explicitly ban same-turn transitions. "You CANNOT plan and implement in the same response."
- **Outcome:** Added Handshake Rule to AGENTS.md Golden Rule #6.

---

## 8. Dogfooding & Framework Hygiene (v4.2)

### 8.1. Template Pollution Risk
- **Learning:** When dogfooding (developing the framework *using* the framework), AI agents tend to treat `templates/` as active files, populating them with project data. This "pollutes" the distributable starter kit.
- **Mandate:** Treat `anamnesis_starter/` as a build artifact. Never edit files in `templates/` to store project state. Always copy to `.context/` or `specs/` first.
- **Outcome:** Strictly enforced read-only policy for templates during framework development.

### 8.2. Separation of Concerns (Meta vs. Starter)
- **Learning:** Mixing framework source code (`knowledge_base/`) with the distributable product (`anamnesis_starter/`) leads to confusion about which `README.md` or `AGENTS.md` to edit.
- **Mandate:** Explicit separation. `knowledge_base` is the repo (Meta-Project). `anamnesis_starter` is the product (Distributable).
- **Outcome:** Restructured directory layout in v4.2.
