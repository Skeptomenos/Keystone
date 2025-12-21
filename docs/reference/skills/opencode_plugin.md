# OpenCode Skills Plugin Reference

> **Source:** [malhashemi/opencode-skills](https://github.com/malhashemi/opencode-skills)
> **Status:** Implementation Reference for Keystone

## 1. Overview
The OpenCode Skills Plugin brings the Anthropic Agent Skills Spec (v1.0) to the OpenCode environment. It automatically discovers skills on the filesystem and registers them as dynamic tools.

## 2. Discovery Paths
The plugin scans these locations (lowest to highest priority):
1. `~/.config/opencode/skills/`
2. `~/.opencode/skills/`
3. `$OPENCODE_CONFIG_DIR/skills/`
4. `.opencode/skills/` (Project-local, overrides others)

## 3. Tool Registration
- **Naming Convention**: A skill in directory `my-skill/` becomes a tool named `skills_my_skill`.
- **Activation**: When the agent calls `skills_my_skill`, the plugin uses a **Message Insertion Pattern** to inject the skill's content into the conversation as a `noReply` user message.

## 4. Path Resolution
- The plugin provides the agent with a **Base Directory Context**.
- Example: `Base directory for this skill: /path/to/.opencode/skills/my-skill/`.
- This allows the agent to resolve relative paths like `scripts/helper.py` correctly using standard tools (e.g., `python3`).

## 5. Permissions
- Skills can be enabled/disabled in `opencode.json`:
```json
{
  "tools": {
    "skills*": false,
    "skills_keystone_board": true
  }
}
```
- Permissions can be scoped per agent (e.g., only the `build` agent gets specific skills).

## 6. Requirements
- **OpenCode SDK ≥ 1.0.126**: Required for the `noReply` message insertion pattern.
