# Anthropic Agent Skills Specification (v1.0)

> **Source:** [Anthropic Documentation](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)
> **Status:** Reference for Keystone Framework

## 1. Core Concept
Agent Skills are modular, filesystem-based capabilities that extend an AI agent's functionality. They follow a **Progressive Disclosure** model to minimize context window usage.

## 2. Structure
A skill is a directory containing a mandatory `SKILL.md` and optional supporting files.

```text
skill-name/
├── SKILL.md              # Mandatory: Instructions & Metadata
├── [SUPPORTING_DOCS].md  # Optional: Deep-dive instructions
├── scripts/              # Optional: Executable code (Python, Bash, etc.)
└── assets/               # Optional: Templates, schemas, or static data
```

## 3. `SKILL.md` Format
Must contain YAML frontmatter and Markdown body.

### Frontmatter (Level 1: Discovery)
Always loaded into the system prompt.
- **name**: `[a-z0-9-]+` (Must match directory name).
- **description**: Concise explanation of *what* it does and *when* to use it.
- **allowed-tools**: (Optional) List of tools the skill is permitted to use.

### Body (Level 2: Instructions)
Loaded only when the agent triggers the skill (via `read` or `skills_` tool).
- Contains procedural knowledge, workflows, and examples.
- Can reference Level 3 resources (scripts/files).

## 4. Progressive Disclosure Levels
| Level | Content | Loading Trigger | Context Cost |
|-------|---------|-----------------|--------------|
| **1** | Metadata | Startup | ~100 tokens |
| **2** | Instructions | Skill Triggered | < 5k tokens |
| **3** | Resources | As needed (via Bash) | 0 (until read) |

## 5. Best Practices
- **Deterministic Logic**: Use scripts for parsing or complex math; use instructions for flexible reasoning.
- **Relative Paths**: Always reference bundled files relative to the skill root.
- **Clear Triggers**: The description must clearly signal to the AI when this skill is the best tool for the job.
