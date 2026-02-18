# Project LLM

## Current Project Folder Structure

```text
.
├── config/                     # Configuration files for the agent/environment
├── mcp/                        # Model Context Protocol server configurations
│   ├── db.toml
│   ├── gemini_cli.jsonc
│   ├── mcp.json
│   └── settings.global.json
├── plugins/                    # Internal plugins for the agent
│   ├── ding/                   # Plugins to play sound
│   └── plan/                   # Planning capability plugin
├── projects/                   # Workspace for all independent projects (parallel items)
│   ├── bigtwo/                 # Multiplayer Big Two poker game
│   ├── data/                   # Centralized data storage
│   ├── env_setup/              # Core system logic and environment setup
│   ├── fun/                    # Lifestyle project (eat, drink, fun, travel)
│   ├── llm_plugin/             # Current AI research and MCP plugin development
│   ├── playground/             # Testing space for new libraries
│   ├── security/               # Private network security scanning tools
│   └── stock/                  # Stock market strategy and analysis
├── rules/                      # Agent behavior rules and conventions
│   ├── GEMINI.global.md
│   ├── GEMINI.profile.md
│   ├── consistency.md
│   ├── go-convention.md
│   ├── go-structure.md
│   ├── go-testing.md
│   ├── go-tools.md
│   └── profile-structure.md
├── skills/                     # Specialized capability modules for the agent
│   ├── celebrity-quotes/
│   ├── character-profile-generator/
│   ├── chat-summary/
│   ├── clean-unused-code/
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
├── README.task.md              # Task context and prompt templates
├── README.template.md          # Template for AI news reports
├── README.todo                 # Task tracking and open items
├── run.sh                      # Execution script
└── settings.json               # VS Code or project settings
```

## AI Model List, Price and Information

| Model Name                 | Input Price (1M tokens) | Output Price (1M tokens) | Context Window | Knowledge Cutoff |
| :------------------------- | :---------------------- | :----------------------- | :------------- | :--------------- |
| **GPT-4o**                 | $2.50                   | $10.00                   | 128k           | Oct 2023         |
| **ChatGPT-5.2 Codex**      | $5.00                   | $15.00                   | 256k           | Jan 2026         |
| **Claude 3.5 Sonnet**      | $3.00                   | $15.00                   | 200k           | Apr 2024         |
| **Claude Code Sonnet 4.5** | $3.00                   | $15.00                   | 500k           | Dec 2025         |
| **Claude Code Sonnet 4.6** | $3.50                   | $17.50                   | 1M             | Mar 2026         |
| **Claude Code Opus 4.5**   | $10.00                  | $30.00                   | 500k           | Dec 2025         |
| **Claude Code Opus 4.6**   | $12.00                  | $36.00                   | 1M             | Mar 2026         |
| **Gemini 1.5 Pro**         | $1.25                   | $3.75                    | 2M             | Feb 2024         |
| **Gemini 3 Flash**         | $0.50                   | $1.50                    | 5M             | Jan 2026         |
| **Gemini 3 Pro**           | $2.50                   | $7.50                    | 5M             | Jan 2026         |
| **Kimi 2.5**               | $1.00                   | $3.00                    | 10M            | Feb 2026         |

_Prices are estimated based on standard API rates as of Feb 2026. Please check official provider pages for the most up-to-date pricing._

## AI News Reports

Use [README.template.md](README.template.md) to generate AI news reports. File name pattern should be YYYYMMDD.md and put it under `specs` folder
