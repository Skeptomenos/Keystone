---
name: keystone-init
description: Initializes a new Keystone workstream. Use this when the user says "Create workstream", "Start new feature", or "Initialize workstream from plan".
---

# Keystone Workstream Initializer

This skill guides you through the process of scaffolding a new parallel workstream in a Keystone project.

## Instructions

1. **Verify Name**: Read `keystone/project/workstreams/registry.md`. Ensure the requested workstream name is unique.
2. **Load Template**: Read `keystone/templates/workstream_unified.md`.
3. **Populate Content**:
   - Replace `[Name]` with the workstream name.
   - Replace `[Session Name]` with your current session name (ask user if unknown).
   - Link the `Driving Plan` to the relevant file in `keystone/plans/`.
   - If initializing from a plan, extract the high-level requirements and convert them into tasks in the `## 📋 Tasks` section.
4. **Write File**: Save the populated content to `keystone/project/workstreams/[name].md`.
5. **Update Registry**: Append a new row to the table in `keystone/project/workstreams/registry.md` with the workstream details and Status: `Active`.
6. **Sync Board**: Call `skills_keystone_board` to register the new workstream on the global project board.
7. **Confirm**: Report success to the user and ask if they are ready to start the first task.

## Constraints
- **Isolation**: Only create the workstream file within `keystone/project/workstreams/`.
- **Consistency**: Always use the `workstream_unified.md` template to ensure the Board Aggregator can parse the tasks correctly.
