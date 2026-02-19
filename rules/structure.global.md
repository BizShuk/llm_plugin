---
name: Global Structure
trigger: always_on
description: This is global folder structure for user level (Home Folder: /Users/shuk)
globs: "**/*"
---

# Global Structure (Home Folder: `/Users/shuk`)

This rule defines the standard directory structure centered in the user's home directory (`~`).

## 1. Workspace Tree Overview

```text
/Users/shuk/
├── .agent/                 # Global agent configurations
│   ├── skills/             # Shared agent skills
│   ├── rules/              # Global behavior rules
│   └── workflows/          # System-wide workflows
├── .gemini/                # Gemini-specific brain and context
│   ├── GEMINI.md           # Global rule for gemini cli and antigravity
│   └── antigravity/        # Antigravity agent specific state
│       ├── skills/         # Antigravity agent skills
│       └── global_workflows/ # Antigravity global workflow
├── .local/                 # Local tools & env (Go, NPM, Homebrew)
├── .openclaw/              # Agent brain & workspace context
│   └── workspace/          # Core agent cognitive files
├── bin/                    # Global CLI tools
└── projects/               # Parallel project workspace
    ├── env_setup/          # Environment & script management
    ├── llm_plugin/         # Any AI LLM model related
    ├── fun/                # Lifestyle & travel project
    ├── security/           # Network security & scanning
    ├── stock/              # Stock analysis & data
    └── ...                 # Other micro-service style projects (Parallel microservices)
```

## 2. System Directories (.local/)

The `.local/` folder stores user-specific data, configurations, and environment states.

| Directory/File | Description                                                          |
| :------------- | :------------------------------------------------------------------- |
| `bin/`         | **Binaries**: Local-specific execution scripts and tools.            |
| `go/`          | **Go Workspace**: Core Go development workspace.                     |
| `homebrew/`    | **Homebrew**: Local installation and managed packages.               |
| `npm-global/`  | **NPM Global**: Shared Node.js tools across projects.                |
| `share/`       | **Shared Data**: Documents, icons, and shared application resources. |
| `state/`       | **State & Logs**: Application runtime logs and cache states.         |

## 3. Projects Directory (projects/)

@structure.project.md
