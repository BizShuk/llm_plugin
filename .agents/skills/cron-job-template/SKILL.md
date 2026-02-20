---
name: Cron Job Template
description: A template and guide for executing recurring tasks defined in project README.task.md files.
---

# Cron Job Template Skill

This skill defines the protocol for an AI agent to act as a "Cron Job" or "Task Runner" for a specific project. It relies on standard README files to establish context and execution logic without hardcoded complex scripts.

## 1. Context Establishment

Before executing any task, the agent MUST establish context by reading:

1. **Global/Project Structure**: `README.structure.md` (usually in the root or `llm_plugin` project) or `@README.structure.md` if available, to understand the workspace layout.
2. **Project Context**: The `README.md` of the target project (e.g., `projects/fun/README.md`).

## 2. Task Definition (`README.task.md`)

The core logic is defined in `README.task.md` within the target project. This file acts as the configuration and instruction set.

### File Format

The `README.task.md` should contain:

- **Context References**: Links to relevant documentation (e.g., `context: ./README.md`).
- **Parameters**: A list of configurable parameters with **default values**.
    - Format: `- parameter_name: (default: value)`
- **Execution Steps**: High-level instructions on what to do.
- **Tools/Functions**: Specific tools to use or ignore based on parameters.

### Execution Protocol

When triggered to run a task for a project:

1. **Read Task Definition**: Open `projects/<project>/README.task.md`.
2. **Parse Parameters**: Identify all parameters. If no user override is provided, **STRICTLY** use the default values defined in the file.
3. **Determine Scope**: Check for conditions (e.g., "if recommend result is 0, DON'T search local knowledge").
4. **Execute**: Perform the task using the defined tools (e.g., `search_web`, `find_by_name`).
5. **Output**: Generate the requested artifacts (e.g., generic report, chat summary).

## 3. Reference Example (from `projects/fun`)

If running the `find-activity` task:

1. **User Input**: "Run daily activity check" (implied defaults) OR "Run activity check for `location: Tokyo`".
2. **Agent Action**:
    - Reads `projects/fun/README.task.md`.
    - Sets `location = Taipei Taiwan` (default) unless overridden.
    - Sets `fun type = all` (default).
    - Executes search tools.
    - Summarizes results.

## 4. Usage

To use this skill, you MUST specify the **Task Name** and the **Schedule**:

> "Run the [Task Name] cron task for [Project Name] [Schedule]"

### Parameters

- **Task Name**: The exact task activity defined in `README.task.md` (e.g., `find-activity`).
- **Schedule**:
    - `one-time` (default): Run immediately once.
    - `daily`: Run once every day.
    - `weekly`: Run once every week.

### Examples

- "Run the `find-activity` cron task for `fun` project **one-time**."
- "Run the `stock-analysis` cron task for `stock` project **daily**."

The agent will look up the `README.task.md` in the specified project, confirm the task name exists, and execute it according to the schedule.
