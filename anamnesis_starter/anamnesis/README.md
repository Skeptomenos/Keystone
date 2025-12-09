# Anamnesis

> A stateful, spec-driven framework for AI-assisted software engineering.

**Version:** 4.3

## Setup Instructions

Copy the entire `anamnesis_starter/` folder to your new project root, then rename it to your project name.

```bash
cp -r anamnesis_starter/ my-new-project/
cd my-new-project/
```

## Structure

```
your-project/
├── anamnesis/                   # The framework (you are here)
│   ├── directives/              # How AI should think and act
│   │   ├── THINKING.md          # First Principles & Design
│   │   └── EXECUTION.md         # Build & Deliver
│   │
│   ├── standards/               # Code quality rules
│   │   ├── INDEX.md             # Which standards to read when
│   │   ├── global.md            # Language-agnostic rules
│   │   ├── python.md            # Python-specific
│   │   └── typescript.md        # TypeScript-specific
│   │
│   ├── templates/               # Frequently recreated files
│   │   ├── active_state.md      # Session state template
│   │   ├── handover.md          # Handover template
│   │   ├── board.md             # Kanban board template
│   │   ├── workstream.md        # Workstream template
│   │   ├── CLAUDE.md            # Claude-specific AGENTS variant
│   │   └── GEMINI.md            # Gemini-specific AGENTS variant
│   │
│   ├── specs/                   # Specification files
│   │   ├── problem.md           # Problem definition
│   │   ├── options.md           # Solution options
│   │   ├── requirements.md      # EARS syntax requirements
│   │   ├── design.md            # Architecture diagrams
│   │   ├── tasks.md             # Atomic task list
│   │   ├── tech.md              # Technical decisions
│   │   └── product.md           # Product definition
│   │
│   ├── .context/                # Project state (living files)
│   │   ├── mission.md           # Living objective
│   │   ├── backlog.md           # Ideas and deferred work
│   │   ├── tech-stack.md        # Approved tools
│   │   ├── board.md             # Kanban board (auto-generated)
│   │   └── workstreams/         # Parallel work contexts
│   │
│   ├── PROJECT_LEARNINGS.md     # Process wisdom
│   ├── DECISION_LOG.md          # Architectural decisions
│   └── README.md                # This file
│
├── AGENTS.md                    # Entry point for AI agents
└── CHANGELOG.md                 # Project version history
```

## Getting Started

1. **Read AGENTS.md** — Entry point that tells AI what to read when
2. **Fill in `.context/mission.md`** — Define your project objective
3. **Start working** — AI will follow the framework automatically

## Documentation

| Document | Purpose |
|----------|---------|
| [Migration Guide](docs/MIGRATION.md) | Upgrade from earlier versions |

## Task Management (v4.3+)

The framework includes enhanced task management with:
- **Dependencies:** Track task relationships and blocking items
- **Status Workflow:** Backlog → Open → In Progress → Blocked → Done → Archive
- **Workstreams:** Organize parallel work contexts for features or investigations
- **Kanban Board:** Visual progress tracking via auto-generated `board.md`

See `anamnesis/specs/tasks.md` for task template and `anamnesis/docs/MIGRATION.md` for upgrading existing projects.

## Key Concepts

- **Directives:** Rules for how AI should think (THINKING.md) and execute (EXECUTION.md)
- **Standards:** Code quality rules organized by language/domain
- **Templates:** Files that get archived and recreated frequently
- **Specs:** Feature specifications (one set per project)
- **.context/:** Living project state that evolves over time

## 📝 How to Use Specs (Spec-Driven Development)

Specs are living documents that serve as the "Source of Truth". You do not need to write them manually; the AI helps you draft them.

### The Lifecycle
1.  **Define (`problem.md`):** You explain the goal. AI drafts the problem statement, user persona, and success metrics.
2.  **Explore (`options.md`):** AI proposes 2-3 technical approaches. You choose one.
3.  **Specify (`requirements.md`):** AI converts the choice into "When... Then..." rules.
4.  **Plan (`tasks.md`):** AI breaks it down into atomic, checklist-style tasks.
5.  **Execute:** AI implements tasks one by one, checking them off.

### User Responsibility
*   **Mission:** You must fill in `.context/mission.md` manually at the start.
*   **Approval:** You must review and approve spec changes before the AI builds.
