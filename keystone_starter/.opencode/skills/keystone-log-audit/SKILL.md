---
name: keystone-log-audit
description: Enforces "Beautiful Logs" standards on modified files. Use this during the session Epilogue to replace prints with loggers and ensure consistent formatting.
---

# Keystone Logging Audit

This skill performs a surgical audit of modified files to ensure they comply with the project's logging standards.

## Instructions

1. **Identify Scope**: Run `git status` or check your session history to identify files modified in this session.
2. **Audit Rules**: For each modified Python file, perform the following refactors:
   - **Zero-Tolerance for `print()`**: Replace all `print(...)` calls with `logger.info(...)` or `logger.error(...)`.
     - *Exception*: If a line ends with `# skip-audit`, do not modify it.
   - **Contextual Naming**: Ensure the file initializes its logger using the standard pattern:
     ```python
     import logging
     logger = logging.getLogger(__name__)
     ```
     (Adjust import path if the project uses a custom `get_logger` wrapper).
   - **Mandatory Identifiers**: If a log is inside a loop processing a collection (e.g., ETFs, Assets), ensure the log message includes a unique identifier (e.g., ISIN, Name, or ID).
   - **Traceback Standard**: Ensure every `except` block that logs an error uses `logger.error(..., exc_info=True)`.
3. **Verification**: Run the project's tests or linting tools to ensure the refactor didn't break functionality.
4. **Report**: Summarize the changes (e.g., "Audited 3 files: replaced 5 prints, added 2 tracebacks").

## Constraints
- **Surgical Only**: Do not audit files that were not modified in the current session.
- **Preserve Logic**: Do not change the underlying business logic, only the logging implementation.
