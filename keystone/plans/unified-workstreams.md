# Implementation Plan: Unified Workstream Architecture

> **Objective:** Simplify multi-agent coordination by consolidating workstream state into single, unified files per context.

## 1. Core Logic Changes
- **Single Source of Truth:** Move from Trinity (`tasks.md`, `active_state.md`, `workstream.md`) to Unified (`workstream.md` with sections).
- **Skill Intelligence:** Update `aggregate.py` to become "Section-Aware".
- **Migration Strategy:** "Sandbox Split" logic in `INITIATOR.md` must now generate unified files.

## 2. File Structure Target
```
keystone/project/
├── workstreams/
│   ├── auth/
│   │   └── workstream.md  # Contains Objectives, Tasks, Active State
│   ├── ui/
│   │   └── workstream.md
│   └── registry.md
```

## 3. Implementation Steps
- [ ] **Refactor Skill:** Update `aggregate.py` regex to find `## Tasks` blocks.
- [ ] **Create Template:** `keystone/templates/workstream.md` (Unified).
- [ ] **Update Directives:** `EXECUTION.md` (Phase 0/4) and `INITIATOR.md` (Pathway C).
- [ ] **Audit:** Verify parser works on the new format.

## 4. Risks & Mitigations
- **Risk:** Parser misses tasks if section headers are typo'd.
- **Mitigation:** Strict regex anchor on `## Tasks` (case insensitive).
- **Risk:** File grows too large.
- **Mitigation:** Recommendation to clear "Iteration Log" > 50 lines.
