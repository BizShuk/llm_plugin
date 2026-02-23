# PicoClaw 核心架構分析 (PicoClaw Core Architecture Analysis)

這份文件記錄了對 `devops/picoclaw` 專案的架構分析結果。PicoClaw 是一個以 Go 語言實現的高效率 AI 代理框架，設計目標為超低資源佔用與極速啟動。

---

## 整體架構圖 (Architecture Diagram)

以下是 PicoClaw 的系統元件連結與資料流向圖：

![PicoClaw Architecture Diagram](/Users/shuk/.gemini/antigravity/brain/f93a458b-4084-4d63-9d95-dd724e9fa215/picoclaw_architecture_diagram_1771767839209.png)

---

## 元件詳細說明 (Component Details)

### 1. 閘道層 (Gateway Layer)

- **路徑**：`pkg/routing`, `pkg/channels`
- **功能**：處理與外部平台的整合 (Telegram, Discord, LINE, WeCom 等)。
- **特性**：將外部輸入標準化，並支援 Webhook 與長輪詢 (Long-polling)。

### 2. 核心代理引擎 (Core Agent Engine)

- **路徑**：`pkg/agent`
- **功能**：核心決策單元（大腦）。
- **核心組件**：
  - **State Management**：維持代理的當前運行狀態。
  - **Session History**：管理多輪對話的上下文。
  - **Prompt Engineering**：建構發送給 LLM 的 System Message 與 Context。

### 3. 邏輯與執行層 (Logic/Execution Layer)

- **路徑**：`pkg/bus`, `pkg/cron`, `pkg/heartbeat`
- **功能**：排程與非同步任務管理。
- **核心組件**：
  - **Event Bus**：系統內的 Publish/Subscribe 機制。
  - **Cron Jobs**：定時執行特定任務。
  - **Heartbeat**：背景自我運行任務（每 30 分鐘觸發一次，檢查 `HEARTBEAT.md`）。

### 4. 執行工具 (Execution Tools)

- **路徑**：`pkg/tools`, `pkg/skills`
- **功能**：代理與物理世界互動的能力。
- **核心組件**：
  - **Tools**：基礎操作（如檔案讀寫、網頁搜尋、`exec` 指令執行）。
  - **Skills**：封裝好的進階功能。
  - **Security Sandbox**：確保工具執行僅限於 `workspace/` 範圍內。

### 5. 外部供應商 (External LLM Providers)

- **路徑**：`pkg/providers`
- - **功能**：統一對接不同的 LLM API (OpenAI, Anthropic, Gemini, Zhipu 等)。
- - **設計**：支援 Zero-code 擴充供應商。

---

## 專案目錄結構摘要 (Directory Structure Summary)

- `cmd/`: 命令列進入點。
- `pkg/`: 所有的核心邏輯套件。
- `workspace/`: 預設的代理工作目錄與沙箱環境。
- `assets/`: 相關媒體與圖檔。
- `docs/`: 規格書與教學文件。
