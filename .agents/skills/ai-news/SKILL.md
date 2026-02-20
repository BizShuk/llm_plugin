---
title: AI News Report
description: Summarize the latest AI news and create a report
tags: ["news", "ai", "reporting", "intelligence"]
category: information
version: 1.0.0
---

# AI News Reporter

## Summarize and Report AI News

Gathers intelligence from various AI-related sources and generates a structured report in the `specs` folder. Sources to check include:

- **General AI News**: Latest headlines and breakthroughs.
- **OpenClaw Release Log**: Updates from [OpenClaw Repo](https://github.com/openclaw/openclaw/releases).
- **AI Trading Competition**: Status and updates.
- **AI Model Competition**: Model benchmarks or releases.
- **MoltBook Hot Topics**: Trending topics on [MoltBook](https://www.moltbook.com).

The reporter should also update the "AI Model List and Price Package" table if newer pricing or model details are found.

### Parameters

- `time period`: The time range for gathering news (Default: `from -7 days`)

### Output Folder Structure

```text
specs/
└── news-{YYYYMMDD}.md
```

- **File Name Pattern**: Generate a file named `news-{YYYYMMDD}.md` (e.g., `news-20240520.md`) under the `specs` folder.

### Output File Content

The output file should follow this template and include the gathered summaries and updated model information:

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
