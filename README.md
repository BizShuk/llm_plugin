# Project LLM

## Current Project Folder Structure

```text
.
├── config/                     # Configuration files for the global agent/environment
├── mcp/                        # Model Context Protocol server configurations
│   ├── db.toml
│   ├── gemini_cli.jsonc
│   ├── mcp.json
│   └── settings.global.json
├── plugins/                    # Internal plugins for the agent
│   ├── ding/                   # Plugins to play sound
│   └── plan/                   # Planning capability plugin
├── projects/                   # (skipped for sub folders)LLM configurations for all independent projects (parallel items)
├── rules/                      # Agent behavior rules and conventions
│   ├── structure.global.md    # Global folder structure rule
│   ├── GEMINI.global.md        # Core AI principles
│   ├── GEMINI.profile.md
│   ├── GEMINI.tmp.md
│   ├── consistency.md
│   ├── go-convention.md
│   ├── go-structure.md
│   ├── go-testing.md
│   └── go-tools.md
├── skills/                     # Specialized capability modules for the agent
│   ├── ai-news/
│   ├── celebrity-quotes/
│   ├── character-profile-generator/
│   ├── chat-summary/
│   ├── clean-unused-code/
│   ├── cron-job-template/
│   ├── go-function-analysis/
│   ├── private-network-scan/
│   ├── project-metadata/
│   ├── security-scanner/
│   ├── skill_generator/
│   └── social-buisiness-explore/
├── specs/                      # Feature specifications and plans
│   └── 20260217-chat-summary-skill.md
├── workflows/                  # Defined agent workflows
│   └── screen-writer.md
├── GEMINI.md                   # Project-specific AI context
├── README.md                   # Project overview (this file)
├── README.structure.md         # Detailed folder structure context
├── README.todo                 # Task tracking and open items
├── run.sh                      # Execution script
└── settings.json               # VS Code or project settings
```
