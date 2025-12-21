# Custom Execution Directives (ProjectKeystone)

> **Purpose:** Internal quality gates for the Keystone Meta-Project.
> **Scope:** These rules apply ONLY when modifying `keystone_starter/`.

---

## Phase 5: The Rigid Auditor (Pre-Commit Gate)

Before finalizing any change to `keystone_starter/`, you MUST execute this audit protocol.

### 5.1: Path Integrity Check
- **Action:** Read `keystone_starter/AGENTS.md`.
- **Verify:** Every file path mentioned in the "When to Read" or "Structure" sections MUST exist in the `keystone_starter/` directory.
- **Evidence:** List any missing or broken paths in `keystone/project/starter_health.md`.

### 5.2: Instruction Density Check
- **Action:** Compare the new version of a directive (`.core.md`) with the previous version (via `git diff`).
- **Verify:** If the total line count or instruction density decreased by >10%, justify why this isn't a loss of critical logic.
- **Evidence:** Log the justification in `keystone/project/starter_health.md`.

### 5.3: Cross-Protocol Consistency
- **Action:** If you changed a "Phase" name or an "Artifact" name in `THINKING.core.md`:
- **Verify:** Ensure `EXECUTION.core.md` and `INITIATOR.md` are updated to use the new names.
- **Evidence:** State "Cross-reference verified" in the audit log.

### 5.4: Template Sync Check
- **Action:** Compare the MVA templates in `INITIATOR.md` with the actual files in `keystone_starter/keystone/project/`.
- **Verify:** They must be functionally identical (ignoring placeholder text).
- **Evidence:** Log any discrepancies.

---

## Audit Reporting

Every session that touches the starter MUST end with an entry in `keystone/project/starter_health.md` using the following format:

```markdown
### [YYYY-MM-DD] Audit: [Task Name]
- **Status:** PASS | FAIL | WARNING
- **Integrity:** [Path check results]
- **Consistency:** [Logic sync results]
- **Density:** [Instruction count change %]
- **Notes:** [Any manual overrides or accepted risks]
```
