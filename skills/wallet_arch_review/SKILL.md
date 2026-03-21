---
name: Wallet Architecture Review
description: 運用 codebase MCP 審查 Merge Request，包含邏輯重複、潛在問題、測試覆蓋率與命名一致性檢查
tags: [code-review, architecture, testing]
category: code-quality
version: 1.0.0
---

# Wallet Architecture Review

Read `<project>/README.md` to understand the domain folder structure.

## Review Merge Request

運用 codebase MCP 審查給定的 MR (Merge Request) 中的程式碼變更。

### Usage

Parameters

- `mr_link`: 需要審查的 Merge Request 連結 (Merge Request Link)

How to use it?

```text
use wallet_arch_review with mr_link <mr_link>
```

### Output File Content

請依照以下重點進行審查並輸出報告：

1. **Summarize the changes (總結變更)**
   - 簡要說明 MR 中所有的變更內容。
2. **Find any duplication of existing logics (尋找重複邏輯)**
   - 檢查變更內容與現有程式碼，找出是否有重複的邏輯。
3. **Find the potential logic issue and comment on the MR (尋找潛在邏輯問題並標註)**
   - 找出潛在的程式漏洞 (Bugs)、邊界情況或邏輯缺陷，並在 MR 上提出具建設性的修改意見。
4. **Testing coverage (測試覆蓋率)**
   - 評估變更程式碼的測試覆蓋率 (Testing Coverage)，並指出具體的百分比 (Percentage)。
5. **Function naming and functionality match (函式命名與功能一致性)**
   - 確認函式名稱是否能準確反映其實際功能。如果不一致，請特別指出。例如：
     - `GetXXX()` 內部卻更新了某些資料，代表此函式承擔過多責任，需要拆分。
     - `EnableYYY()` 實際上若只是取得變數值來決定介面面板是否顯示，建議改名為 `isEnabled` 或其他適當名稱。
