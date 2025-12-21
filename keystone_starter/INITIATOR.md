# Keystone Initiator (The Wizard)

> **Purpose:** Zero-friction setup and update for the Keystone framework.
> **Usage:** Copy this file to your project root and ask your AI: "Initialize Keystone" or "Update Keystone".
> **Source of Truth:** `https://github.com/Skeptomenos/Keystone/tree/main/keystone_starter`

## Instructions for AI

You are the Keystone Setup Wizard. Your goal is to guide the user through a frictionless setup or update process.

### Phase 0: Bootstrap (Fetch Latest)

**The Mapping Rule:**
- **Source (Remote):** Files located in `keystone_starter/` at the GitHub URL above.
- **Destination (Local):** Your current project root and the `keystone/` directory.

1. **Access the repository:** Use your available tools to read the latest framework files from the **Source (Remote)** URL.
2. **Files to fetch from Source:**
    - `INITIATOR.md` (Fetch this first and follow its instructions if they differ from the local copy)
    - `keystone/directives/THINKING.md`
    - `keystone/directives/EXECUTION.md`
    - `keystone/standards/*`
    - `keystone/templates/*`
    - `keystone/project/*` (as templates for initial state)
    - `keystone/specs/*` (as templates for core specs)
    - `AGENTS.md` (as a template)
3. **Fallback:** If you cannot access the internet, use the MVA templates embedded at the bottom of this file to perform a minimal setup.

### The Preservation Protocol (MANDATORY)
When updating or retrofitting, you MUST adhere to these preservation rules:
1. **Smart Merge Directives:** NEVER blindly overwrite **Local** `THINKING.md` or `EXECUTION.md` with **Remote** versions.
    - Read the **Local** version to identify user-added rules, patterns, or overrides.
    - Merge the **Remote** framework logic while strictly preserving these **Local** customizations.
2. **Project State & Specs:** NEVER overwrite existing files in **Local** `keystone/project/` or `keystone/specs/`. If a file exists, you may only append new standard sections or add missing metadata from the **Remote** templates.
3. **Shared Files (AGENTS.md, README.md):** Use a "Surgical Merge" strategy:
    - **Preserve (Local User-Owned):** Project Name, Overview, Tech Stack, Custom Commands, and any user-added sections.
    - **Update (Remote Framework-Owned):** Protocol, Structure, Golden Rules, Task Management Rules, and State File lists.
4. **Source Attribution:** When retrofitting, do not delete existing comments or documentation; move them to **Local** `keystone/specs/` and cite them.

### Phase 1: Discovery & Intent
1. **Greet the user** and explain your purpose.
2. **Detect the project state:**
    - **New Project:** No files or only basic structure.
    - **Existing Project:** Codebase exists but no **Local** Keystone setup.
    - **Update:** **Local** Keystone files already exist.
3. **Ask for confirmation** of the detected state.

### Phase 2: Setup Pathways

#### Pathway A: New Project (Design Thinking First)
1. **Interview the user** using Design Thinking principles (from **Remote** `THINKING.md`).
2. **Draft the core specs:** `problem.md`, `product.md`, `mission.md`.
3. **Propose an MVP scope** and initial `tasks.md`.
4. **Generate the framework structure** (copying from **Remote** templates).

#### Pathway B: Existing Project (The Archaeologist)
1. **Execute Surgical Scan Protocol:**
    - **Pass 1 (Surface):** List files in the root and first level of subdirectories (ignore `node_modules`, `venv`, `.git`).
    - **Pass 2 (DNA):** Identify the tech stack by looking for:
        - *Dependency Maps:* `package.json`, `requirements.txt`, `go.mod`, `Cargo.toml`, `Gemfile`, `pom.xml`.
        - *Infrastructure:* `Dockerfile`, `docker-compose.yml`, `.github/`.
        - *Config:* `tsconfig.json`, `pyproject.toml`, `.env.example`.
        - *Entry Points:* `index.ts`, `main.py`, `app.go`, `src/App.tsx`.
    - **Pass 3 (Deep Dive):** Read ONLY the high-signal files identified in Pass 2 to extract core logic and dependencies.
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
1. **Detect current version** by reading the `Protocol Version` header in **Local** `keystone/directives/*.md`.
2. **Compare with latest version** (v4.4).
3. **Structural Migration:**
    - Scan for legacy directories: `anamnesis/`, `docs/`, `plan/`, `.context/`.
    - **Anamnesis to Keystone Rename:**
        - If `anamnesis/` exists, rename it to `keystone/`.
        - Update all internal file references from `anamnesis/` to `keystone/`.
        - Replace strings "Anamnesis" with "Keystone" in **Local** `AGENTS.md`, `README.md`, and project state files.
    - Map other legacy files to new standard:
        - `docs/*.md` -> `keystone/specs/`
        - `plan/*.md` -> `keystone/project/tasks.md`
        - `.context/*` -> `keystone/project/`
    - **STOP** and ask user to approve the directory restructuring and renaming plan.
4. **Smart Merge Migration:**
    - If `.core.md` and `.custom.md` files exist, merge them into single **Local** `.md` files (e.g., `THINKING.md`).
5. **Dry-Run Preview:**
    - Generate a `MIGRATION_PREVIEW.md` showing exactly which sections of **Local** directives will be updated and which user customizations will be preserved.
    - Highlight any new mandatory protocols (e.g., OODA loop, Smart Merging).
6. **Apply Updates:**
    - Overwrite **Local** `INITIATOR.md` and `keystone/templates/*` with **Remote** versions.
    - **Smart Merge Directives:** Update **Local** `THINKING.md` and `EXECUTION.md` by merging **Remote** framework logic while strictly preserving **Local** user-added rules.
    - **Surgical Merge Shared Files:** Update **Local** `AGENTS.md` and `README.md` by replacing framework-owned sections with **Remote** logic while strictly preserving **Local** user-owned context (Name, Overview, Tech Stack, Commands).
    - **Sync Missing Standards:** Add any missing standard files in **Local** `keystone/project/` and `keystone/specs/` that exist in the **Remote** framework but are missing in the **Local** project.
    - **STOP** and ask user to review the changes.

### Phase 3: Finalization
1. **Verify the setup:**
    - Generate **Local** `keystone/project/health.md` using the template.
    - Perform a "Self-Test" (check paths, directives, and state).
    - Mark all checks as PASS/FAIL in the health file.
2. **Handover:** Create **Local** `handover.md` and `active_state.md`.
3. **Congratulations!** 🎉

---

## Minimal Viable Keystone (MVA) Templates

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

## 1. Surgical Scan Results
- **Pass 1 (Surface):** [Summary of directory structure]
- **Pass 2 (DNA):** [High-signal files detected]
- **Pass 3 (Deep Dive):** [Key dependencies and entry points extracted]

## 2. Tech Stack Detected
- **Languages:** [e.g., TypeScript, Python]
- **Frameworks:** [e.g., React, FastAPI]
- **Infrastructure:** [e.g., Docker, AWS]

## 3. Core Modules
| Module | Path | Responsibility |
|--------|------|----------------|
| [Name] | [Path] | [Description] |

## 4. Significant Files Scanned
- [ ] `[Path]` — [Reason for scanning]

## 5. Architectural Patterns
- [e.g., Layered Architecture, Microservices]

## 6. Open Questions
- [ ] [Question about codebase behavior]
```

### MIGRATION_PREVIEW.md
```markdown
# Migration Preview (v[Old] -> v[New])

> **Purpose:** Show proposed changes before applying framework updates.
> **Status:** Pending Approval

## 1. Core Logic to be Updated (Remote Source -> Local Destination)
- [ ] `keystone/directives/THINKING.md` (Smart Merge)
- [ ] `keystone/directives/EXECUTION.md` (Smart Merge)
- [ ] `INITIATOR.md` (Overwrite)
- [ ] `keystone/templates/*` (Overwrite)

## 2. New Standard Files to be Added (if missing in Local)
- [ ] `keystone/project/tech-stack.md`
- [ ] `keystone/specs/tech.md`
- [ ] (Any other missing framework files)

## 3. Local Custom Context to be Preserved (STRICT)
- [ ] User-added rules in `THINKING.md` and `EXECUTION.md`
- [ ] `keystone/project/*` (Existing user state - mission, tasks, etc.)
- [ ] `keystone/specs/*` (Existing user specs)
- [ ] User-owned sections in `AGENTS.md` and `README.md`

## 4. Key Protocol Changes
- **Smart Merging:** Directives are now merged into single files to reduce directory clutter while preserving your custom rules.
- **Wizard Onboarding:** `INITIATOR.md` is now the primary entry point for setup.
```

### health.md
```markdown
# Framework Health Check

> **Purpose:** Verify that the Keystone framework is correctly installed and configured.
> **Auditor:** AI Agent (following INITIATOR.md Phase 3)

---

## 🏥 Health Status: [STATUS]

| Check | Result | Evidence |
|-------|--------|----------|
| **Directory Structure** | [PASS/FAIL] | `keystone/project/` exists |
| **Path Integrity** | [PASS/FAIL] | `AGENTS.md` paths are valid |
| **Smart Merging** | [PASS/FAIL] | Directives contain both core and custom logic |
| **State Initialized** | [PASS/FAIL] | `active_state.md` has an objective |
| **Template Sync** | [PASS/FAIL] | `templates/` match v4.4 standard |

---

## 🛠️ Issues Found
- [ ] [List any missing files or broken links]

## ⏭️ Recommended Fixes
- [ ] [List commands to fix the issues]

---

**Last Verified:** [YYYY-MM-DD HH:MM]
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

## 1. Surgical Scan Results
- **Pass 1 (Surface):** [Summary of directory structure]
- **Pass 2 (DNA):** [High-signal files detected]
- **Pass 3 (Deep Dive):** [Key dependencies and entry points extracted]

## 2. Tech Stack Detected
- **Languages:** [e.g., TypeScript, Python]
- **Frameworks:** [e.g., React, FastAPI]
- **Infrastructure:** [e.g., Docker, AWS]

## 3. Core Modules
| Module | Path | Responsibility |
|--------|------|----------------|
| [Name] | [Path] | [Description] |

## 4. Significant Files Scanned
- [ ] `[Path]` — [Reason for scanning]

## 5. Architectural Patterns
- [e.g., Layered Architecture, Microservices]

## 6. Open Questions
- [ ] [Question about codebase behavior]
```

### MIGRATION_PREVIEW.md
```markdown
# Migration Preview (v[Old] -> v[New])

> **Purpose:** Show proposed changes before applying framework updates.
> **Status:** Pending Approval

## 1. Core Logic to be Updated (Smart Merge)
- [ ] `keystone/directives/THINKING.md`
- [ ] `keystone/directives/EXECUTION.md`
- [ ] `INITIATOR.md` (The Wizard)
- [ ] `keystone/templates/*`

## 2. New Standard Files to be Added (if missing)
- [ ] `keystone/project/tech-stack.md`
- [ ] `keystone/specs/tech.md`
- [ ] (Any other missing framework files)

## 3. Custom Context to be Preserved (STRICT)
- [ ] User-added rules in `THINKING.md` and `EXECUTION.md`
- [ ] `keystone/project/*` (Existing user state - mission, tasks, etc.)
- [ ] `keystone/specs/*` (Existing user specs)
- [ ] User-owned sections in `AGENTS.md` and `README.md`

## 4. Key Protocol Changes
- **Smart Merging:** Directives are now merged into single files to reduce directory clutter while preserving your custom rules.
- **Wizard Onboarding:** `INITIATOR.md` is now the primary entry point for setup.

## 4. User Action Required
- [ ] Review the diffs in core directives.
- [ ] Update `AGENTS.md` if custom model configurations exist.
```

### health.md
```markdown
# Framework Health Check

> **Purpose:** Verify that the Keystone framework is correctly installed and configured.
> **Auditor:** AI Agent (following INITIATOR.md Phase 3)

---

## 🏥 Health Status: [STATUS]

| Check | Result | Evidence |
|-------|--------|----------|
| **Directory Structure** | [PASS/FAIL] | `keystone/project/` exists |
| **Path Integrity** | [PASS/FAIL] | `AGENTS.md` paths are valid |
| **Smart Merging** | [PASS/FAIL] | Directives contain both core and custom logic |
| **State Initialized** | [PASS/FAIL] | `active_state.md` has an objective |
| **Template Sync** | [PASS/FAIL] | `templates/` match v4.4 standard |

---

## 🛠️ Issues Found
- [ ] [List any missing files or broken links]

## ⏭️ Recommended Fixes
- [ ] [List commands to fix the issues]

---

**Last Verified:** [YYYY-MM-DD HH:MM]
```
