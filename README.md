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

## Service List

AI related

- ChatGPT: 內容靈感、開場鉤子、銷售話術
- Claude: 長篇寫作＋深度研究
- Perplexity: 快速 AI搜尋研究
- Poppy AI: 把混亂想法整理成有結構的內容
- Jasper: 行銷文案＋ Email 自動化序列
- ElevenLabs: 像真人一樣自然的Al配音
- Descript: 用編輯文字的方式剪輯影片
- CapCut: 短影音剪輯
- Canva: 封面圖、輪播圖、名單 磁鐵製作
- Midjourney: 吸睛視覺設計
- Lovable: 建立簡單應用程式或工具
- GoHighLevel: 銷售漏斗+Email 自動化
- ManyChat: 私訊自動化（開發潛在客戶）
- Notion AI: 整理内容與系統架構
- Zapier: 串接你的各種工具
- Stripe: 收款工具
