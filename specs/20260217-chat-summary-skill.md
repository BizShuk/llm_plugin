---
title: Chat Summary Skill Creation
description: Create a skill to summarize chat sessions into structured spec files at <workspace>/specs/YYYYMMDD-<feature>.md.
status: done
date: 2026-02-17
---

# Chat Summary Skill Creation

## 目標 (Objective)

建立一個 `chat-summary` 技能，能自動將對話內容摘要成規格文件（Spec），並依日期與功能名稱存入 `specs/` 目錄。

## 決策 (Decisions)

- **Workflow-Based 設計**：採用 Gather → Generate → Save → Confirm 的四階段工作流。
- **模板化輸出**：使用 `assets/template.md` 定義 YAML frontmatter（含 title, description, status, date）與 Markdown 結構。
- **簡化目錄結構**：由於核心邏輯依賴指令引導，因此移除不必要的 `scripts/` 與 `references/` 目錄。
- **快速啟動**：在 `README.prompt.md` 新增 `/chat-summary` 範例指令。

## 產出 (Artifacts)

| 檔案                                     | 說明                     |
| ---------------------------------------- | ------------------------ |
| `skills/chat-summary/SKILL.md`           | Skill 核心工作流指令檔   |
| `skills/chat-summary/assets/template.md` | Spec 檔案結構範本        |
| `README.prompt.md`                       | 新增了觸發摘要的範例指令 |

## 未完成 (Open Items)

- 無（已通過 `quick_validate.py` 驗證）

## 備註 (Notes)

- 輸出路徑格為 `specs/YYYYMMDD-<feature>.md`。
- 被摘要出的 `<feature>` 由 AI 根據對話內容推斷。
