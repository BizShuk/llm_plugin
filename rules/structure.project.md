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
├── .agents/                # Antigravity 專案工作流 (Antigravity project workflow) (Symlink to .agent)
│   ├── rules/              # 專案特定個別規則 (Project-specific individual rules)
│   └── workflows/          # 專案特定個別工作流 (Project-specific individual workflows)
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

## 技能資料夾結構 (Skill Folder Structure)

每個技能必須位於 `.agent/skills/` 下的獨立資料夾中，並將該技能相關的所有規則 (rules) 和工作流 (workflows) 整合在同一資料夾內。

```text
.agent/skills/[skill-name]/
├── SKILL.md                # 技能定義與說明 (Skill definition and instructions)
├── rules/                  # 該技能專用的規則 (Skill-specific rules)
├── references/             # 輸出範本與參考文件 (Output templates and references)
└── scripts/                # 輔助腳本或工具 (Supporting scripts or utilities)
```
