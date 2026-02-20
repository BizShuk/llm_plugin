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

## AI Model List, Price and Information

| Model Name                  | Input (1M) | Output (1M) | Context | Cutoff   | Capabilities  | Best Use Case                                      |
| :-------------------------- | :--------- | :---------- | :------ | :------- | :------------ | :------------------------------------------------- |
| `ChatGPT-5.2 Codex`         | $5.00      | $15.00      | 256k    | Jan 2026 | Multi, Reason | Advanced autonomous coding & software architecture |
| `Claude Code Opus 4.6`      | $12.00     | $36.00      | 1M      | Mar 2026 | Multi, Reason | Complex reasoning & highly accurate code gen       |
| `Claude Code Sonnet 4.6`    | $3.50      | $17.50      | 1M      | Mar 2026 | Multi, Reason | Fast developer assistant, multi-file editing       |
| `DeepSeek V3.1`             | $0.27      | $1.00       | 128k    | Jul 2025 | Reasoning     | Efficient coding & structured data extraction      |
| `DeepSeek R1`               | $0.55      | $2.19       | 128k    | Jul 2025 | Reasoning     | Open-weights competitive reasoning & math          |
| `Gemini 3.1 Pro`            | $2.00      | $12.00      | 1M      | Jan 2025 | Multi, Reason | Deep reasoning across massive datasets             |
| `Gemini 3.1 Flash`          | $0.50      | $3.00       | 1M      | Jan 2025 | Multi, Reason | Ultra-fast creative writing & massive context      |
| `Gemini 2.5 Flash-Lite`     | $0.10      | $0.40       | 1M      | Jan 2026 | Multimodal    | Real-time, low-latency conversational AI           |
| `Gemini 1.5 Flash`          | $0.075     | $0.30       | 1M      | Feb 2024 | Multimodal    | Balanced price/perf for long context vision        |
| `Gemini 1.5 Flash-8B`       | $0.0375    | $0.15       | 1M      | Feb 2024 | Multimodal    | High-volume, low-cost simple classification        |
| `GLM 5`                     | $1.00      | $3.20       | 200k    | Feb 2026 | Multi, Reason | High-performance bilingual MoE tasks               |
| `GLM 4.7`                   | $0.60      | $2.20       | 200k    | Dec 2025 | -             | Localized coding & Chinese developer tools         |
| `GPT-4o`                    | $2.50      | $10.00      | 128k    | Oct 2023 | Multimodal    | General flagship logic, coding, and precise vision |
| `Grok 4`                    | $3.00      | $15.00      | 256k    | Dec 2024 | Multimodal    | Real-time X intelligence & edgy interaction        |
| `Grok 3`                    | $3.00      | $15.00      | 1M      | Feb 2025 | Multimodal    | Versatile analysis with live X data integration    |
| `Jina Embeddings v3`        | $0.02      | N/A         | 8k      | N/A      | Embedding     | Advanced multilingual & long-form retrieval        |
| `Kimi 2.5`                  | $0.60      | $3.00       | 262k    | Jan 2026 | Multi, Reason | Long-document analysis & agentic workflows         |
| `Kimi 2`                    | $0.15      | $2.50       | 256k    | Jul 2025 | Reasoning     | Cost-effective reasoning & base coding             |
| `Minimax M2.5`              | $0.30      | $1.20       | 205k    | Feb 2026 | Multi, Reason | Creative multimodal content & versatile agents     |
| `Minimax M2`                | $0.255     | $1.00       | 197k    | Oct 2025 | -             | Reliable base Chinese language processing          |
| `OpenAI text-embed-3-large` | $0.13      | N/A         | 8k      | N/A      | Embedding     | General purpose semantic search across industries  |
| `Phi-4`                     | $0.06      | $0.14       | 16k     | Jun 2024 | Reasoning     | High-performance SLM for complex reasoning         |
| `Qwen 2.5 Max`              | $1.60      | $6.40       | 128k    | Jan 2025 | Multi, Reason | Flagship logic & complex reasoning capabilities    |
| `Qwen 2.5 Turbo`            | $0.05      | $0.20       | 1M      | Jan 2025 | Multi         | Ultra-long context & efficient large-scale tasks   |
| `Qwen 3-Max-Thinking`       | $1.20      | $6.00       | 128k    | Jan 2026 | Reasoning     | Flagship reasoning with step-by-step thinking      |
| `Qwen 3.5-397B-A17B`        | $0.40      | $2.40       | 256k    | Feb 2026 | Multi, Reason | Native MoE vision-language model                   |
| `Qwen 3.5-Plus`             | $0.40      | $2.40       | 1M      | Feb 2026 | Multi, Reason | Hosted long-context version of Qwen 3.5            |
| `Voyage-4` (Embed)          | $0.06      | N/A         | 32k     | N/A      | Embedding     | Top-tier retrieval for enterprise RAG systems      |

_Prices are estimated based on standard API rates as of Feb 2026. Please check official provider pages for the most up-to-date pricing._

## AI News Reports

Weekly AI news is generated under @specs/
