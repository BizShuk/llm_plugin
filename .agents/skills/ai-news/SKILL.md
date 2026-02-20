---
name: ai-news
description: Summarize the latest AI news and create a report
---

# AI News Reporter

This skill summarizes the latest AI news and creates a report. The file name pattern should be `YYYYMMDD.md` and it should be placed under the `specs` folder.

parameters:

time period: (default: from -7 days)

## Instructions

1. **Gather Intelligence**:
   - **General AI News**: Search for the latest AI news.
   - **OpenClaw Release Log**: Check [OpenClaw Repo](https://github.com/openclaw/openclaw/releases).
   - **AI Trading Competition**: Check for updates.
   - **AI Model Competition**: Check for model benchmarks or releases.
   - **MoltBook Hot Topics**: Check [MoltBook](https://www.moltbook.com).

2. **Create Report**:
   - Generate a file named `specs/{YYYYMMDD}.md` (e.g., `specs/20240520.md`).
   - Use the template below.
   - Fill in the `[Summary of ...]` placeholders with the gathered information.
   - Ensure the "AI Model List and Price Package" table is included as is, or updated if you have newer information on these specific models.

## Template

```markdown
# AI News Report - [YYYY-MM-DD]

## AI Model List and Price Package

| Model Name                 | Input Price (1M tokens) | Output Price (1M tokens) | Context Window | Knowledge Cutoff | description                        |
| :------------------------- | :---------------------- | :----------------------- | :------------- | :--------------- | :--------------------------------- |
| **GPT-4o**                 | $2.50                   | $10.00                   | 128k           | Oct 2023         | Flagship model, high intelligence  |
| **ChatGPT-5.2 Codex**      | $5.00                   | $15.00                   | 256k           | Jan 2026         | Specialized for coding tasks       |
| **Claude 3.5 Sonnet**      | $3.00                   | $15.00                   | 200k           | Apr 2024         | Strong logic, coding, and nuance   |
| **Claude Code Sonnet 4.5** | $3.00                   | $15.00                   | 500k           | Dec 2025         | Enhanced reasoning & code gen      |
| **Claude Code Sonnet 4.6** | $3.50                   | $17.50                   | 1M             | Mar 2026         | Ultimate coding specialist         |
| **Claude Code Opus 4.5**   | $10.00                  | $30.00                   | 500k           | Dec 2025         | Deep reasoning flagship            |
| **Claude Code Opus 4.6**   | $12.00                  | $36.00                   | 1M             | Mar 2026         | Next-gen reasoning powerhouse      |
| **Gemini 1.5 Pro**         | $1.25                   | $3.75                    | 2M             | Feb 2024         | Massive context window, multimodal |
| **Gemini 3 Flash**         | $0.50                   | $1.50                    | 5M             | Jan 2026         | Ultra-fast, high capacity          |
| **Gemini 3 Pro**           | $2.50                   | $7.50                    | 5M             | Jan 2026         | Next-gen multimodal reasoning      |
| **Kimi 2.5**               | $1.00                   | $3.00                    | 10M            | Feb 2026         | Extremely long context specialist  |
|                            |                         |                          |                |                  |                                    |

## Latest News

### General AI News

- [Summary of news item 1]
- [Summary of news item 2]

### OpenClaw Release Log

ref: [OpenClaw Repo](https://github.com/openclaw/openclaw/releases)

- [Summary of feature/bug releases]

### AI Trading Competition Update

- [Summary of updates]

### AI Model Competition

- [Summary of model benchmarks or releases]

### MoltBook Hot Topics

ref: [MoltBook](https://www.moltbook.com)

- [Summary of trending topics]
```
