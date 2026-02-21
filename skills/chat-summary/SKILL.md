---
title: 對話摘要 (Chat Summary)
description: 將當前對話摘要成結構化 spec 檔案並存入 specs/ 目錄。 (Summarize a chat session into a structured spec file and save it to the specs/ directory.)
tags: ["summary", "documentation", "spec", "workflow"]
category: documentation
version: 1.1.0
---

# 對話摘要 (Chat Summary)

## 摘要對話 (Summarize Chat)

將當前對話的目標、決策、產出與未完成事項摘要成一份結構化 spec 檔案。此功能用於擷取對話精華，建立標準化的規格文件 (Spec)，以便後續追蹤與開發。

### Parameters

- `feature_name`: 以 kebab-case 命名，反映對話主題。 (Kebab-case name reflecting the chat topic.) (Default: none)
- `file_name` : (default: {YYYYMMDD}-{feature_name}.md)

### Output Folder Structure

```text
/Users/shuk/projects/llm_plugin/specs/
└── {YYYYMMDD}-{feature_name}.md # context_only: file_name
```

- **File Name Pattern**: 使用當前日期 `{YYYYMMDD}` 加上 `{feature_name}`。例如：`20240520-new-api-endpoint.md`。

### Output File Content

依照 `references/template.md` 的範本結構生成，包含以下資訊：

1. **目標 (Objective)**: 使用者的主要目標，1-2 句。
2. **決策 (Decisions)**: 在對話中做出的關鍵設計或技術決策。
3. **產出 (Artifacts)**: 建立或修改的檔案清單，含簡述。
4. **未完成事項 (Open Items)**: 尚未完成或需後續跟進的事項。
5. **備註 (Notes)**: 其他補充說明（可選）。
