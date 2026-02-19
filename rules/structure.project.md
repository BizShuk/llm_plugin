---
name: Project Structure
trigger: always_on
description: This is standard project skeleton rules for all repositories
globs: "**/*"
---

# Project Structure

Every project MUST follow this consistent skeleton to ensure uniformity across the workspace.

## Standard Single Project Structure

```text
project_name/
├── .agent/                 # Main agent configuration
│   ├── skills/             # Project-specific skills
│   ├── rules/              # Project-specific rules
│   ├── workflows/          # Project-specific workflows
│   └── settings.json       # Project-specific agent settings
├── .agents/                # Antigravity project workflow (Symlink to .agent)
│   └── workflows/          # Project-specific individual workflows
├── .gemini/                # Symlink to .agent
├── .gitignore              # Git ignore file (symlinked to .geminiignore)
├── GEMINI.md               # Project-specific AI context
├── README.md               # Project overview (Must include domain folder structure)
├── README.todo             # Task tracking and open items
├── specs/                  # Phase-based specifications and plans
└── [Domain Folders]/       # Physical project structure (e.g., cmd/, svc/, model/, etc.)
```

> [!IMPORTANT]
> **Project Domain Structure**: The `README.md` MUST include the current project's folder structure. If the domain folders or the structure in `README.md` is missing/outdated, you MUST call the `project_metadata` skill to synchronize and document the project's physical layout.
