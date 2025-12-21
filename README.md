# Keystone

> A stateful, spec-driven framework for AI-assisted software engineering.

> **⚠️ META-PROJECT:** This IS the framework source. Changes propagate to all downstream projects.

**Version:** 4.6.0

## Setup Instructions

Copy the entire `keystone_starter/` folder to your new project root, then rename it to your project name.

```bash
cp -r keystone_starter/ my-new-project/
cd my-new-project/
```

## Structure

```
your-project/
├── keystone/                   # The framework
│   ├── directives/              # How AI should think and act
│   │   ├── THINKING.md          # First Principles & Design
│   │   └── EXECUTION.md         # Build & Deliver
│   │
│   ├── standards/               # Code quality rules
│   │   ├── INDEX.md             # Which standards to read when
│   │   └── ...                  # Language-specific rules
│   │
│   ├── templates/               # Frequently recreated files
│   │   └── workstream.md        # Unified workstream template
│   │
│   ├── specs/                   # Specification files
│   │   ├── problem.md           # Problem definition
│   │   └── ...                  # Other specs
│   │
│   ├── project/                 # Project state (living files)
│   │   ├── mission.md           # Global North Star
│   │   ├── board.md             # Global Kanban (auto-generated)
│   │   └── workstreams/         # Parallel work contexts
│   │       ├── registry.md      # Session & Workstream map
│   │       └── [name]/          # Isolated workstream folder
│   │           └── workstream.md # Unified state & tasks
│   │
│   ├── PROJECT_LEARNINGS.md     # Process wisdom
│   ├── DECISION_LOG.md          # Architectural decisions
│   └── README.md                # Framework user guide
│
├── .opencode/skills/            # Agent Skills (Board, Init)
├── AGENTS.md                    # Entry point for AI agents
├── INITIATOR.md                 # Setup & Update Wizard
└── CHANGELOG.md                 # Project version history
```

## Getting Started

1. **Copy INITIATOR.md** — Copy this file to your project root.
2. **Run Wizard** — Ask your AI: "Initialize Keystone" or "Update Keystone".
3. **Follow Instructions** — The AI will guide you through the setup and skill installation.

## Task Management (v4.6+)

The framework is optimized for **Parallel AI Engineering**:
- **Unified Workstreams:** Tasks, Active State, and Handover are consolidated into a single `workstream.md` file per context.
- **Agent Skills:** Automated tools for scaffolding workstreams (`keystone-init`) and aggregating progress (`keystone-board`).
- **Isolation:** Each AI session owns its own directory, preventing Git merge conflicts and context bleed.

### User Commands

| Command | Action |
|---------|--------|
| "Create workstream [name]" | Call `skills_keystone_init` to scaffold a new context |
| "Generate board" | Call `skills_keystone_board` to sync global progress |
| "Next task" | Find and start next Open task in active workstream |
| "Switch to [workstream]" | Change active workstream focus |

---

## 🏗️ Meta-Project Information

This repository is the **meta-project** that develops the Keystone framework itself.

- **Framework Source:** `keystone_starter/` (distributable)
- **Maintainer Tools:** Run `./keystone/bin/audit.sh` to verify the starter integrity.

### Version History

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.
