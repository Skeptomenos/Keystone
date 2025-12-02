# Anamnesis

> A stateful, spec-driven framework for AI-assisted software engineering.

> **⚠️ META-PROJECT:** This IS the framework source. Changes propagate to all downstream projects.

## Overview

Anamnesis solves core AI-assisted coding problems:
- **Amnesia** → Persistent state (`.context/`)
- **Hallucination** → Spec-Driven Development (`docs/specs/`)
- **Vibe Coding** → Consensus Gates
- **Monolithic Code** → Atomic decomposition

**Version:** 4.1

## Tech Stack

- **Format:** Markdown (.md)
- **Diagrams:** Mermaid.js
- **Version Control:** Git with Conventional Commits

## Structure

```
coding/                      # Framework (distributable)
├── THINKING_DIRECTIVES.md   # First Principles & Design
├── EXECUTION_DIRECTIVES.md  # Build & Deliver
├── CODING_STANDARDS.md      # Quality rules
└── templates/               # All templates

docs/                        # Research and documentation
.context/                    # Session state management
```

---

## Protocol

### Golden Rules

1. **State:** Read `.context/active_state.md` at start, update at end
2. **Non-Destructive:** Never delete documentation—append or refine
3. **Naming:** UPPERCASE.template.md for root files, lowercase for specs
4. **Dogfooding:** This project follows its own framework

> **ESCAPE HATCH:** Simple questions or read-only tasks → skip protocol, act immediately.

### When to Read

| Task | File |
|------|------|
| New feature, refactor | `coding/THINKING_DIRECTIVES.md` |
| Complex bug | `coding/THINKING_DIRECTIVES.md` (T1-RCA) |
| Implementation | `coding/EXECUTION_DIRECTIVES.md` |
| Code review | `coding/CODING_STANDARDS.md` |
| Project constraints | `PROJECT_LEARNINGS.md` |

---

## Commands

```bash
git status                    # Check state
git diff                      # Review changes
ls coding/templates/          # Inspect templates
```

## Constraints

- **Meta-project** - Changes affect all downstream projects
- **Append-only** - Never delete sections without permission
- **Template naming** - Conventions must be followed

## State Files

`.context/active_state.md` (current) | `.context/handover.md` (previous) | `PROJECT_LEARNINGS.md` (wisdom)
