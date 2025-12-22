# Implementation Plan: Logging Audit Skill

> **Objective:** Automate the enforcement of "Beautiful Logs" standards using a specialized Agent Skill triggered during the session Epilogue.

## 1. Core Components
- **Skill:** `keystone-log-audit` (Instruction-based + `ast-grep` patterns).
- **Trigger:** Integrated into `EXECUTION.md` Phase 4 (Epilogue).
- **Scope:** Surgical audit of files modified in the current session.

## 2. Implementation Steps
- [ ] **Workstream Initiation:** Create `keystone/project/workstreams/logging-audit.md`.
- [ ] **Skill Scaffolding:** Create `.opencode/skills/keystone-log-audit/SKILL.md`.
- [ ] **Directive Integration:** Update `EXECUTION.md` to include the mandatory audit step in the Epilogue.
- [ ] **Starter Sync:** Propagate changes to `keystone_starter/`.

## 3. Skill Logic (The "Enforcer")
The skill will instruct the agent to:
1. Identify modified files using `git status` or session history.
2. For each file:
   - Replace `print()` with `logger.info()` or `logger.error()`.
   - Ensure `get_logger(__name__)` is initialized.
   - Ensure `except` blocks use `exc_info=True`.
   - Inject identifiers into loop logs (AI-assisted reasoning).

## 4. Risks & Mitigations
- **Risk:** Over-auditing legacy code.
- **Mitigation:** Limit scope to `git diff` (modified files only).
- **Risk:** Breaking non-logging `print` calls (e.g., CLI tools).
- **Mitigation:** Add "Escape Hatch" comment ` # skip-audit` for intentional prints.
