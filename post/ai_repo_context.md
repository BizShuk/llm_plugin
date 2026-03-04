# AI 專案上下文 (AI Repo Context)

| 工具             | 產出核心 (Output Core) | 資訊密度 | 壓縮率         | AI 獲得的超能力                            |
| :--------------- | :--------------------- | :------- | :------------- | :----------------------------------------- |
| `Repomix`        | 全量代碼 Markdown      | 🟢 高    | 🟡 中          | 能夠進行細節重構與邏輯查錯。               |
| `Aider Repo Map` | 符號簽名 (AST)         | 🔴 極高  | 🟢 極高        | 建立全域架構導航，解決跨檔案引用問題。     |
| `llms.txt`       | 專案規範與摘要         | 🟡 中    | 🟢 最高        | 快速了解專案意圖、API 規範與技術棧。       |
| `Code2Prompt`    | 模板化片段 (Snippets)  | 🟢 高    | 🟡 中 (依模板) | 針對特定任務（如寫測試、改 Bug）精準打擊。 |
| `Graphtage`      | 依賴與差異圖譜         | 🟡 中    | 🟡 中          | 處理跨模組依賴與版本升級造成的衝突。       |

## 1. `Repomix`：最直覺的「全能打包檔」

它產出的結果是一個巨大的 `.md` 檔案，包含 `目錄樹 (Directory Tree)` 與經過清理的 `程式碼 (Code)`。

- 結果特徵：AI 擁有了專案的 `短期完整記憶`。
- 缺點：如果 `專案 (Project)` 超過 `50,000` 行，會直接撐爆 `大型語言模型 (LLM)` 的 `上下文視窗 (Context Window)` 或導致回應變慢。

### 使用 `npx` 直接執行 (免安裝)

```bash
npx repomix
```

### 或全域安裝

```bash
npm install -g repomix
repomix # 在專案目錄下執行
repomix --include src/internal/
```

## 2. `Aider Repo Map`：最聰明的「架構地圖」

它利用 `tree-sitter` 只提取 `函數名 (Function Name)`、`類別名 (Class Name)` 及其 `參數 (Parameters)`，不包含 `函數體 (Function Body)`。

- 結果特徵：這像是一張 `地圖`，AI 知道 `UserHandler` 在哪裡，但不知道具體怎麼寫的。
- 優勢：在 `1M+ Token` 的時代，這能讓 AI 同時 `看見` 上千個檔案的關聯。

```bash
uvx aider-chat
aider --show-repo-map > .agent/repo_map.txt
```

## 3. `llms.txt`：最標準的「門牌與簡介」

這是 `2026` 年 `代理人 (Agent)` 進入 `代碼庫 (Repo)` 後 `第一眼` 讀取的檔案。

- 結果特徵：它是人機共讀的。告訴 AI：「這個專案是用 `Go` 寫的，入口在 `main.go`，API 規範在 `/docs`」。
- 優勢：避免 AI 在幾萬個檔案裡亂逛，直接指明方向。

```bash
npx llms-txt-generator .
uvx llmstxt-architect --url https://your-project-docs.com
```

## 4. `Code2Prompt`：最精準的「手術刀」

它允許你自定義 `Handlebars` 模板。

- 結果特徵：你可以只提取「所有與 `資料庫 (Database)` 相關的 `介面 (Interface)`」。
- 優勢：`資訊密度` 自定義，適合自動化流程（例如：每晚自動產出 `應用程式介面 (API)` 變更摘要）。

## 5. `Graphtage`：最硬核的「依賴路徑」

它產出的結果更偏向於 `結構化的差異 (Structured Diff)`。

- 結果特徵：它會告訴 AI：「`函數 A` 修改後，透過三層引用會影響到遠端的 `模組 B`」。
- 優勢：修補複雜 `程式錯誤 (Bug)` 或是處理 `單一儲存庫 (Monorepo)` 依賴時不可或缺。

```bash
uvx graphtage file1.json file2.json
```
