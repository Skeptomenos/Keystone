---
name: keystone-board
description: Aggregates tasks from all Keystone workstreams into a central project board. Use this when a task is updated, a new workstream is created, or when the user says "generate board".
---

# Keystone Board Aggregator

This skill synchronizes the distributed task state of a Keystone project into a human-readable `keystone/project/board.md`. It handles parallel workstreams, prefixed task IDs, and cross-workstream dependencies.

## Instructions

1. **Discovery**: The skill scans the following locations for task data:
   - `keystone/project/history/legacy_monolith_tasks.md` (Legacy tasks)
   - `keystone/project/workstreams/*.md` (Unified workstream files)
   - `keystone/project/workstreams/registry.md` (Session and workstream metadata)

2. **Execution**: Run the bundled aggregation script using Python 3.
   ```bash
   python3 scripts/aggregate.py
   ```

3. **Output**: The script generates or updates `keystone/project/board.md`.

4. **Verification**: After execution, read the summary output from the script to confirm the number of tasks parsed and any dependency warnings.

## Constraints
- **Read-Only**: This skill never modifies the source `tasks.md` files.
- **Prefixed IDs**: It expects task IDs to be prefixed (e.g., `AUTH-001`) to avoid collisions.
- **Standard Python**: The script uses only the Python standard library.

## Troubleshooting
- If a task is missing from the board, ensure its ID follows the `PREFIX-000` format.
- If a dependency is not resolving, check if the referenced ID exists in any of the scanned `tasks.md` files.
