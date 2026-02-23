# OpenClaw 閘道器通訊分析 (OpenClaw Gateway Communication Analysis)

OpenClaw 的閘道器 (Gateway) 採用 Node.js 執行環境，具備完整的 HTTP 與 WebSocket 伺服器功能，提供多種方式與 Agent 進行通訊。

## 1. 鉤子 HTTP API (Hooks HTTP API)

這是最適合自動化整合（如腳本、CI/CD 或其他專案調用）的方式。它允許外部系統透過標準的 HTTP POST 請求向特定 Agent 發送訊息。

- **端點 (Endpoint)**: `POST /hooks/agent` (或自定義路徑)
- **通訊協定 (Protocol)**: HTTP/HTTPS
- **認證方式 (Auth)**: 使用 Bearer Token 進行驗證。
- **功能**:
  - 支援指定 `agentId`、`sessionKey`。
  - 支援自定義訊息處理對應規則 (Hook Mappings)。
- **範例指令 (Example)**:

  ```bash
  curl -X POST http://localhost:18789/hooks/agent \
    -H "Authorization: Bearer <YOUR_HOOK_TOKEN>" \
    -H "Content-Type: application/json" \  "hooks": {
    "enabled": true,
    "path": "/hooks",
    "token": "my-shared-secret",
    "mappings": [
      {
        "id": "github-alert",
        "match": { "path": "github" },
        "action": "agent",
        "messageTemplate": "從 GitHub 收到通知：{{body.action}}"
      }
    ],
    -d '{
      "agentId": "main",
      "message": "這是一條外部調用訊息",
      "name": "ExternalScript"
    }'
  ```

```bash
# curl
curl -X POST http://localhost:18789/hooks/agent   \
-H "Authorization: Bearer my-shared-secret" \
-H "Content-Type: application/json" \
-d '{
  "agentId": "linfu",
  "message": "test hook whether trigger and whether send to channel",
  "name": "test hook",
  "sessionKey": "main",
  "deliver": true,
  "channel": "last",
  "to":"biz.shuk@gmail.com"
}'
# response
{"ok":true,"runId":"0ca80823-2d7e-4f71-b71b-4ab38c965834"}
```

## 2. OpenAI 相容聊天介面 (OpenAI-compatible Chat Completion API)

OpenClaw 可以模擬成一個 OpenAI 模型供應商，讓支援 OpenAI 協議的應用程式直接調用。

- **端點 (Endpoint)**: `POST /v1/chat/completions`
- **通訊協定 (Protocol)**: HTTP/HTTPS
- **特點**:
  - 支援伺服器發送事件 (SSE) 串流。
  - 需要在配置中明確啟用 `gateway.http.endpoints.chatCompletions.enabled`。
  - 可以透過 `model` 欄位指定 Agent，格式為 `openclaw:<agentId>`。

```bash
# curl
curl -X POST http://localhost:18789/hooks/gb \
   -H "Authorization: Bearer my-shared-secret" \
   -H "Content-Type: application/json" \
   -d '{
     "action": "opened",
     "repository": { "full_name": "shuk/llm_plugin" },
     "sender": { "login": "shuk" }
   }'
# response
{"ok":true,"runId":"5624b969-4f10-48ee-b492-b739abc8132a"}
```

## 3. 核心 WebSocket 協議 (Core WebSocket Protocol)

這是 OpenClaw 官方 CLI、Web 控制台以及行動端節點使用的原生通訊協議。

- **端點 (Endpoint)**: `ws://<host>:<port>`
- **通訊協定 (Protocol)**: WebSocket (WS/WSS)
- **特點**:
  - 提供豐富的雙向與多向事件廣播（如處理狀態、工具調用結果）。
  - 包含握手挑戰機制 (Handshake Challenge) 以確保連線安全性。
  - 不同於 PicoClaw，OpenClaw Gateway 具備 WebSocket 升級器 (WebSocket Upgrader)，能夠主動接收外部連線。

---

## 與 PicoClaw 的主要技術差異

| 特性         | OpenClaw                            | PicoClaw                          |
| :----------- | :---------------------------------- | :-------------------------------- |
| **角色定位** | 完整的 Agent 服務器平台             | 超輕量邊緣運算 Agent              |
| **HTTP API** | 內建 (Hooks, OpenAI, OpenResponses) | 僅提供基本健康檢查 (Health Check) |
| **WS 角色**  | 伺服器端 (接收連線)                 | 客戶端 (主動向外連線)             |
| **TCP 通道** | 不常用/透過插件                     | 內建 MaixCam TCP 通道             |
| **資源消耗** | >100MB RAM                          | <10MB RAM                         |
