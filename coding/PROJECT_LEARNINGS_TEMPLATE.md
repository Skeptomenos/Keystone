# Project Learnings & Mandates

This document tracks the architectural and procedural evolution of the project. It serves as the "Corporate Memory" to prevent regression and guide future development.

---

## 1. Core Principles (Invariants)

### 1.1. The "Relay Race" Model
- **Learning:** LLM sessions are ephemeral and prone to amnesia. Treating each prompt as an isolated event leads to fragmented code and lost context.
- **Mandate:** Development must be treated as a relay race. State MUST be persisted in `.context/active_state.md` and passed via `.context/handover.md`.

### 1.2. First Principles over Frameworks
- **Learning:** Asking an LLM to "Architect a Solution" often results in bloated, framework-heavy monoliths.
- **Mandate:** We must enforce **Recursive Decomposition**. Problems must be broken down into "Atomic Units" (Pure Logic) before any orchestration code is written.

### 1.3. Documentation as a Blocking Gate
- **Learning:** Documentation updates that are optional or "suggested" are never done.
- **Mandate:** Documentation updates (`CHANGELOG`, `DECISION_LOG`) must be part of the **Definition of Done** (The Epilogue Protocol).

### 1.4. Non-Destructive Documentation
- **Learning:** AI Agents tend to summarize or rewrite files from scratch, accidentally deleting valuable historical context.
- **Mandate:** Updates to Documentation (README, Specs) must be **Additive**. Never delete or truncate existing sections without explicit instruction.

### 1.5. Pragmatic Spec-Driven Development
- **Learning:** Strict "Chain of Custody" (Product -> Req -> Task -> Code) creates bureaucracy.
- **Mandate:** Specs are Anchors, not Chains. We use **Inlined Constraints** (copying constraints to `tasks.md`) rather than rigid ID linking.

---

## 2. Tactical Patterns (The "How")

### 2.1. The "Zombie State" Prevention
- **Pattern:** The **Intent Check**. Phase 0.1 requires comparing the user's current prompt with the stored `Objective`. If they mismatch -> Archive and Reset.

### 2.2. The "Ad-Hoc" Escape Hatch
- **Pattern:** If a task is < 50 lines or read-only, skip the bureaucratic phases (0-4) and act immediately.

### 2.3. Single Source of Truth for Tasks
- **Pattern:** **No Duplication.** `tasks.md` is the sole owner of execution status (`[ ]` vs `[x]`). `active_state.md` tracks high-level Phase and Learnings only.

---

## 3. Anti-Patterns (What Failed)

### 3.1. "Update After Every Step"
- **Failure:** Requiring a state update after every micro-step doubled latency.
- **Fix:** Update after every **Logical Block**.
