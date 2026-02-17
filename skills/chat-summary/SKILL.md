---
name: chat-summary
description: Summarize a chat session into a structured spec file. This skill should be used when the user wants to capture the outcome of the current conversation as a spec document saved to the workspace specs/ directory.
---

# Chat Summary — 對話摘要

將當前對話的目標、決策、產出與未完成事項摘要成一份結構化 spec 檔案，存入 `<workspace>/specs/YYYYMMDD-<feature>.md`。

## When to Use

- 使用者要求摘要或記錄當前對話結果
- 使用者明確提到 `/chat-summary` 或類似意圖
- 對話即將結束，使用者想留下紀錄

## Workflow

### Step 1 — 收集資訊 (Gather)

從對話歷史中提取以下項目：

| 項目             | 說明                             |
| ---------------- | -------------------------------- |
| **Feature Name** | 以 kebab-case 命名，反映對話主題 |
| **Objective**    | 使用者的主要目標，1-2 句         |
| **Decisions**    | 在對話中做出的關鍵設計或技術決策 |
| **Artifacts**    | 建立或修改的檔案清單，含簡述     |
| **Open Items**   | 尚未完成或需後續跟進的事項       |
| **Notes**        | 其他補充說明（可選）             |

### Step 2 — 生成摘要 (Generate)

依照 `assets/template.md` 的範本結構生成 spec 檔案。

關鍵欄位填寫規則：

- `date` — 以當前日期填寫，格式 `YYYY-MM-DD`
- `feature` — Step 1 推斷出的 Feature Name
- `status` — `done`（對話目標已完成）或 `in-progress`（仍有 Open Items）

### Step 3 — 儲存檔案 (Save)

將產出的 spec 檔案寫入：

```
<workspace>/specs/YYYYMMDD-<feature>.md
```

- `YYYYMMDD` — 當天日期，無分隔符號
- `<feature>` — Step 1 的 Feature Name（kebab-case）
- 若 `specs/` 目錄不存在，自動建立

### Step 4 — 確認 (Confirm)

完成後向使用者回報：

- 檔案路徑
- 摘要預覽（前幾行）

## Resources

### assets/

| File          | Description               |
| ------------- | ------------------------- |
| `template.md` | Spec 檔案的 Markdown 範本 |
