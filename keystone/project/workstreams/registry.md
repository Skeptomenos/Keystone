# Workstream Registry

> **Purpose:** Tracks active parallel sessions and their ownership.
> **Updated by:** AI Agents during session start/end.

| Workstream | Feature Plan | Session Name | Status | Last Heartbeat |
| :--- | :--- | :--- | :--- | :--- |
| `core` | `keystone/plans/unified-workstreams.md` | `root-session` | `Active` | 2025-12-21 |
| `logging-audit` | `keystone/plans/logging-audit.md` | `root-session` | `Active` | 2025-12-22 |
| `initiator` | `keystone/specs/product.md` | `root-session` | `Done` | 2025-12-21 |
| `testing` | `keystone/specs/requirements.md` | `root-session` | `Done` | 2025-12-21 |

---

## Registry Rules
1. **Unique Names**: Workstream names must match their filename in `keystone/project/workstreams/`.
2. **Session Ownership**: Only one session should be `Active` per workstream at a time.
3. **Heartbeat**: Agents should update the `Last Heartbeat` when calling the `keystone-board` skill.
