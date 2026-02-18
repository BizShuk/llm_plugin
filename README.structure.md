# Workspace Folder Structure Context (Home Folder: `/Users/shuk`)

This document provides a comprehensive overview of the folder structure centered in the user's home directory (`~`), clarifying the roles of system-level directories (`.local/`, `.openclaw/`) and user-level directories (`projects/`, `bin/`).

## Workspace Tree Overview

```text
/Users/shuk/
├── .local/                 # Local tools & env (Go, NPM, Homebrew)
├── .openclaw/              # Agent brain & workspace context
│   └── workspace/          # Core agent cognitive files
├── bin/                    # Global CLI tools (Symlink to projects/env_setup/bin)
└── projects/               # Parallel project workspace
    ├── env_setup/          # Environment & script management
    ├── llm_plugin/         # Any AI LLM model related
    ├── fun/                # Lifestyle & travel project
    ├── security/           # Network security & scanning
    ├── stock/              # Stock analysis & data
    └── ...                 # Other micro-service style projects
```

---

## 1. System Directories (.local/)

The `.local/` folder stores user-specific data, configurations, and environment states.

| Directory/File | Description                                                          |
| :------------- | :------------------------------------------------------------------- |
| `bin/`         | **Binaries**: Local-specific execution scripts and tools.            |
| `go/`          | **Go Workspace**: Core Go development workspace.                     |
| `go1.25.5.../` | **Go Distribution**: Go SDK specific version (1.25.5).               |
| `homebrew/`    | **Homebrew**: Local installation and managed packages.               |
| `npm-global/`  | **NPM Global**: Shared Node.js tools across projects.                |
| `nvm/`         | **NVM**: Node Version Manager data and versions.                     |
| `share/`       | **Shared Data**: Documents, icons, and shared application resources. |
| `state/`       | **State & Logs**: Application runtime logs and cache states.         |

---

## 2. Agent Context (.openclaw/workspace/)

The `.openclaw/workspace/` folder serves as the "brain" and context storage for the OpenClaw agent.

### Core Configuration & Metadata

- **`.agent/` / `.agents/`**: Internal agent configurations and symlinks.
- **`.openclaw/`**: Workspace-level state tracking.
- **`HEARTBEAT.md`**: System activity and health status.

### Identity & Cognitive Framework

- **`SOUL.md`**: Core motivations, values, and behavioral style.
- **`IDENTITY.md`**: Agent identity definitions.
- **`AGENTS.md`**: Sub-agent roles and responsibilities.
- **`TOOLS.md`**: Toolsets, definitions, and usage guidelines.
- **`USER.md`**: User preferences, background, and specific context.
- **`MEMORY.md`**: Memory processing logic and hierarchy.

### Dynamic Knowledge Base

- **`memory/`**: Time-stamped memory fragments (e.g., `2026-02-17-0312.md`) for long-term recall.
- **`skills/`**: Specialized capability modules (e.g., `Daily Briefing`, `calendar`, `database`).

---

## 3. User Directories

### `projects/`

- **Purpose**: Main workspace for all independent projects.
- **Standard Metadata**: Each project contains `.agent/` (symlinked to `.gemini/.agents`), `README.md`, `README.todo`, and `README.prompt.md`.

**Philosophy**: All projects are treated as **parallel items or microservices**. There is **no deep hierarchy** concept; each folder in `projects/` is a standalone unit of work or service that interacts with the system independently.

#### Current Project List Analysis

| Project      | Description                                                                             |
| :----------- | :-------------------------------------------------------------------------------------- |
| `bigtwo`     | Multiplayer Big Two poker game implementation using WebSockets.                         |
| `data`       | Centralized data storage for various analysis tasks.                                    |
| `env_setup`  | **Core System Logic**: Contains the `bin/` tools and environment configuration scripts. |
| `fun`        | Lifestyle project focusing on "eat, drink, fun, and travel" (categorized by location).  |
| `imsg`       | iMessage integration or automation experiments.                                         |
| `llm_plugin` | Current AI research and MCP plugin development (Antigravity).                           |
| `playground` | Temporary space for testing new libraries and rapid prototyping.                        |
| `security`   | Private network security scanning and risk assessment tools.                            |
| `stock`      | Stock market strategy analysis and raw data processing.                                 |

#### Standard Single Project Structure

Based on `bin/project_setup`, every project follows a consistent skeleton:

```text
project_name/
├── .agent/                 # Main agent configuration (rules, skills, settings)
├── .gemini/                # Symlink to .agent
├── .gitignore              # Git ignore file (symlinked to .geminiignore)
├── GEMINI.md               # Project-specific AI context
├── README.md               # Project overview
├── README.task.md          # Task context and prompt templates
├── README.todo             # Task tracking and open items
└── specs/                  # Phase-based specifications and plans (Convention)
```

### `bin/`

- **Purpose**: Personal execution scripts and utilities (symlinked from `projects/env_setup/bin/`).
- **Standard Tools**: Includes `system_backup`, `check_alive`, `project_setup`, and `smain`. Added to `$PATH`.

_Last Updated: 2026-02-17_
