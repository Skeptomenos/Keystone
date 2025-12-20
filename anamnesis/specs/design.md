# Design Specification

## Architecture

```
project/
├── anamnesis/                 # Framework root
│   ├── .context/              # State persistence
│   │   ├── mission.md         # Living objective
│   │   ├── backlog.md         # Deferred ideas
│   │   ├── workstreams/       # Parallel work contexts
│   │   └── board.md           # Auto-generated kanban
│   ├── specs/                 # Feature specifications
│   │   ├── tasks.md           # Implementation plan
│   │   └── [feature].md       # Per-feature specs
│   ├── directives/            # AI behavior rules
│   │   ├── THINKING.md        # Design phase
│   │   └── EXECUTION.md       # Build phase
│   ├── standards/             # Code quality rules
│   └── templates/             # Recreatable file templates
├── AGENTS.md                  # AI entry point
└── CHANGELOG.md               # Version history
```

## Key Design Decisions

1. **Markdown-only** - Universal, version-controllable, AI-readable
2. **Separation of concerns** - Directives, standards, specs, state are distinct
3. **Templates vs Living files** - Templates are recreatable; state files evolve
4. **Defense-in-depth** - Multiple approval checkpoints prevent eager execution
