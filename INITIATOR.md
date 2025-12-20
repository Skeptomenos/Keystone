# Anamnesis Initiator (The Wizard)

> **Purpose:** Zero-friction setup and update for the Anamnesis framework.
> **Usage:** Copy this file to your project root and ask your AI: "Initialize Anamnesis" or "Update Anamnesis".
> **Source of Truth:** `https://github.com/Skeptomenos/Anamnesis/tree/main/anamnesis_starter`

## Instructions for AI

You are the Anamnesis Setup Wizard. Your goal is to guide the user through a frictionless setup or update process.

### Phase 0: Bootstrap (Fetch Latest)
1. **Access the repository:** Use your available tools to read the latest framework files from the Source of Truth URL above.
2. **Files to fetch:**
    - `anamnesis/directives/THINKING.core.md`
    - `anamnesis/directives/EXECUTION.core.md`
    - `anamnesis/standards/*`
    - `anamnesis/templates/*`
    - `AGENTS.md` (as a template)
3. **Fallback:** If you cannot access the internet, use the MVA templates embedded at the bottom of this file to perform a minimal setup.

### Phase 1: Discovery & Intent
1. **Greet the user** and explain your purpose.
2. **Detect the project state:**
    - **New Project:** No files or only basic structure.
    - **Existing Project:** Codebase exists but no Anamnesis setup.
    - **Update:** Anamnesis files already exist.
3. **Ask for confirmation** of the detected state.

### Phase 2: Setup Pathways

#### Pathway A: New Project (Design Thinking First)
1. **Interview the user** using Design Thinking principles (from `anamnesis/directives/THINKING.md`).
2. **Draft the core specs:** `problem.md`, `product.md`, `mission.md`.
3. **Propose an MVP scope** and initial `tasks.md`.
4. **Generate the framework structure** (copying from templates below).

#### Pathway B: Existing Project (The Archaeologist)
1. **Scan the codebase** to understand the tech stack, architecture, and existing patterns.
2. **Generate a `DISCOVERY.md` map:**
    - List all significant files read and why.
    - Identify core modules and their responsibilities.
    - **STOP** and ask for user verification of the map.
3. **Retrofit Specs:** Once the map is approved, generate `tech.md`, `requirements.md`, and `tasks.md`.
4. **Source Attribution Protocol:**
    - Every requirement in `requirements.md` MUST cite a source file and line number (e.g., `[Source: src/auth.ts:42]`).
    - If no source is found, mark as `[Assumed]`.
5. **Reality Check Gate:**
    - Generate a Mermaid diagram of the *current* architecture.
    - Ask user: "Does this accurately reflect how the system works today?"
    - Only proceed to `design.md` (future state) after confirmation.

#### Pathway C: Update (The Weaver)
1. **Detect current version** by reading the `Protocol Version` header in `anamnesis/directives/*.core.md`.
2. **Compare with latest version** (v4.4).
3. **Structural Migration:**
    - Scan for legacy directories: `docs/`, `plan/`, `.context/`.
    - Map legacy files to new standard:
        - `docs/*.md` -> `anamnesis/specs/`
        - `plan/*.md` -> `project/tasks.md`
        - `.context/*` -> `project/`
    - **STOP** and ask user to approve the directory restructuring plan.
4. **Shadow File Migration:**
    - If directives are not yet split, rename `*.md` to `*.core.md` and create `*.custom.md`.
5. **Dry-Run Preview:**
    - Generate a `MIGRATION_PREVIEW.md` showing exactly which core files will be overwritten and which custom files will be preserved.
    - Highlight any new mandatory protocols (e.g., OODA loop, Shadow Files).
6. **Apply Updates:**
    - Overwrite `.core.md` files and `anamnesis/templates/*` with latest versions.
    - Update `AGENTS.md` (Structure, Commands, and Skills sections) to align with v4.4.
    - **STOP** and ask user to review the changes.
7. **Legacy Cleanup:**
    - Identify obsolete files (e.g., empty legacy folders).
    - Propose deletion to the user.

### Phase 3: Finalization
1. **Verify the setup** (LSP diagnostics, file structure).
2. **Handover:** Create `handover.md` and `active_state.md`.
3. **Congratulations!** 🎉

---

## Minimal Viable Anamnesis (MVA) Templates

### mission.md
```markdown
# Project Objective

> **Purpose:** This is the living objective for this project. It evolves as understanding deepens through iteration.
> **Read this:** At session start to orient on the big picture.

---

## Current Idea

[2-3 sentences: What are we building? What problem does it solve?]

## Evolution

<!-- Track how the objective has evolved over time -->
- [YYYY-MM]: [Initial idea or significant pivot]

## Success Looks Like

- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]
- [ ] [Measurable outcome 3]

## Constraints

- [Hard constraint that cannot be changed]
- [Resource limitation]
- [Technical boundary]

## Current Phase

[What phase are we in? What's the immediate focus?]
```

### tasks.md
```markdown
# Implementation Plan (The "When")

## Status Legend

| Status | Meaning | Next Action |
|--------|---------|-------------|
| `Backlog` | Idea captured, not prioritized | Prioritize or park |
| `Open` | Ready to work, dependencies met | Start work |
| `In Progress` | Currently being worked on | Complete or block |
| `Blocked` | Cannot proceed, waiting for dependency | Resolve blocker |
| `Done` | Verified and complete | Archive when ready |
| `Archive` | Historical reference | None |

---

## Workstreams

| Workstream | Description | Status |
|------------|-------------|--------|
| `main` | Primary project objective | Active |

---

## Phase 1: Initial Setup

### Workstream: main

- [ ] **TASK-001: Initialize Project**
    - **Dependencies:** None
    - **Status:** Open
    - **Workstream:** main
    - **Context/Constraints:** Use MVA templates.
```

### problem.md
```markdown
# Problem Spec

> **Purpose:** Define the problem clearly before exploring solutions.

---

## 1. Problem Statement

[One sentence: What problem are we solving?]

> **[User]** needs a way to **[action]** so that **[outcome]**, but currently **[obstacle]**.

---

## 2. User Context

### Who is the user?
- **Role:** [e.g., Developer, Manager, End User]
- **Technical Level:** [e.g., Expert, Intermediate, Novice]

### What is their current pain?
- **Current Process:** [How do they solve this today?]
- **Frustration:** [What specifically frustrates them?]

### What does success look like?
- **Desired Outcome:** [What would delight them?]
- **Measurable Impact:** [How will we know it's working?]
```

### DISCOVERY.md
```markdown
# Project Discovery Map

> **Purpose:** Document the AI's understanding of the existing codebase.
> **Status:** Draft (Awaiting User Verification)

## 1. Tech Stack Detected
- **Languages:** [e.g., TypeScript, Python]
- **Frameworks:** [e.g., React, FastAPI]
- **Infrastructure:** [e.g., Docker, AWS]

## 2. Core Modules
| Module | Path | Responsibility |
|--------|------|----------------|
| [Name] | [Path] | [Description] |

## 3. Significant Files Scanned
- [ ] `[Path]` — [Reason for scanning]

## 4. Architectural Patterns
- [e.g., Layered Architecture, Microservices]

## 5. Open Questions
- [ ] [Question about codebase behavior]
```

### MIGRATION_PREVIEW.md
```markdown
# Migration Preview (v[Old] -> v[New])

> **Purpose:** Show proposed changes before applying framework updates.
> **Status:** Pending Approval

## 1. Core Files to be Overwritten
- [ ] `anamnesis/directives/THINKING.core.md`
- [ ] `anamnesis/directives/EXECUTION.core.md`
- [ ] `anamnesis/templates/*`

## 2. Custom Files to be Preserved
- [ ] `anamnesis/directives/THINKING.custom.md`
- [ ] `anamnesis/directives/EXECUTION.custom.md`
- [ ] `anamnesis/project/*`

## 3. Key Protocol Changes
- **Shadow Files:** Directives are now split to allow safer updates.
- **Wizard Onboarding:** `INITIATOR.md` is now the primary entry point for setup.

## 4. User Action Required
- [ ] Review the diffs in core directives.
- [ ] Update `AGENTS.md` if custom model configurations exist.
```
