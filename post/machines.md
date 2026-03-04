# 機器配置 (Machine Configuration)

本文件紀錄在 Apple Silicon Mac 上運行 `本地大型語言模型 (Local Large Language Models)` 的配置建議與效能評估。

## 快取與框架 (Cache & Framework)

為了在 Mac 上獲得最佳體驗，建議採用以下技術：

1. 使用 `llama.cpp` 的 `提示詞快取 (Prompt Cache)`
2. 利用 Apple 官方的 `MLX` 框架
3. 設置 `本地 API 伺服器 (Local API Server)`

### 快速入門 (Quick Start)

```bash
pip install mlx-lm
# 系統會自動從 Hugging Face 下載並轉換
python -m mlx_lm.generate --model mlx-community/Qwen3-30B-A3B-Instruct-4bit --prompt "請幫我寫一段 Go 語言的 Web Crawler"
```

---

## 16GB 記憶體 (16GB RAM)

`可用空間 (Available Space)`：約 `10-12 GB`
適合跑 `中小型 (Small to Medium)` 模型，是入門 `人工智慧本地化 (AI Localization)` 的黃金規格。

### 首選推薦 (Top Recommendations)

| `模型系列 (Model Series)` | `參數與權化 (Params & Quant)` | `特點分析 (Key Features)`                              |
| :------------------------ | :---------------------------- | :----------------------------------------------------- |
| `Llama 3 / 3.1`           | `8B (4-bit / 8-bit)`          | `反應極快，推論速度流暢。`                             |
| `Mistral`                 | `7B v0.3`                     | `經典且穩定的平衡之選。`                               |
| `Qwen 2.5 / 3 Coder`      | `7B / 14B (4-bit)`            | `14B 較為緊繃，建議關閉其他佔記憶體程式。`             |
| `Gemma 3`                 | `4B / 12B`                    | `Google 最新模型，支援視覺 (Vision) 並針對 MLX 優化。` |

### 效能分析 (Performance Analysis)

- `推論速度 (Inference Speed)`：`7B-8B` 等級模型可達 `40-60 tokens/sec`。
- `主要限制 (Main Limitations)`：無法同時開啟過多 `瀏覽器分頁 (Browser Tabs)` 或 `開發工具 (IDE)`，否則會觸發 `交換記憶體 (Swap)` 導致明顯卡頓。

---

## 32GB 記憶體 (32GB RAM)

`可用空間 (Available Space)`：約 `24-28 GB`
此規格為現行的 `甜點位 (Sweet Spot)`，可運行具備強大 `推理能力 (Reasoning)` 與 `編碼能力 (Coding)` 的中大型模型。

### 首選推薦 (Top Recommendations)

| `模型系列 (Model Series)`  | `參數與權化 (Params & Quant)` | `特點分析 (Key Features)`                   |
| :------------------------- | :---------------------------- | :------------------------------------------ |
| `Qwen 3`                   | `32B (4-bit)`                 | `32GB Mac 的最強首選，邏輯能力接近 GPT-4。` |
| `Mistral Small`            | `24B`                         | `在速度與智商之間取得極佳平衡。`            |
| `DeepSeek-R1-Distill-Qwen` | `32B`                         | `具備深度思考能力，適合處理極複雜問題。`    |
| `Gemma 3`                  | `27B`                         | `智商極高，且在 MLX 框架下效能表現優異。`   |

### 效能分析 (Performance Analysis)

- `多工處理 (Multitasking)`：可以在執行 `14B` 模型時，依然流暢進行日常開發工作。
- `極限測試 (Stress Test)`：理論上可加載 `Llama 3 70B (2-bit / 3-bit)`，但這會導致速度降至每秒僅數個單詞，缺乏實用價值。

---

## 256GB 記憶體與 64 核心 (256GB RAM & 64 Cores VM)

`可用空間 (Available Space)`：約 `230-240 GB`
此高階規格的 `虛擬機 (Virtual Machine, VM)` 能夠無極限地流暢運行目前最強大的開源模型，是 `編碼 (Coding)` 與 `通用任務 (General Purpose)` 的核心選擇，且擁有極高的推論速度。

### 首選推薦 (Top Recommendations)

| `模型系列 (Model Series)` | `參數與權化 (Params & Quant)` | `特點分析 (Key Features)`                                                   |
| :------------------------ | :---------------------------- | :-------------------------------------------------------------------------- |
| `Qwen 2.5 / 3 Coder`      | `72B (4-bit / 8-bit)`         | `處理極複雜的程式碼開發與架構設計，反應迅速且支援長文本，編碼首選。`        |
| `Llama 3.1 / 3.3`         | `70B (8-bit / FP16)`          | `能輕鬆運行 70B 近乎全精度，提供穩定的通用推理，速度極其流暢。`             |
| `DeepSeek-V3 / R1`        | `671B (MoE, 4-bit)`           | `頂尖的程式邏輯與深度思考能力，MoE 架構與多核心 CPU 配合使得回應速度極佳。` |
| `Mistral Large`           | `123B (4-bit / 8-bit)`        | `卓越的多語言與通用推理能力，且反應極限迅速。`                              |

### 效能分析 (Performance Analysis)

- `推論速度 (Inference Speed)`：受惠於 `64 核心 (64 Cores)` 的強大算力與頻寬，即使是 `70B` 級別的大型模型，也能提供接近即時回覆的生成速度，完全不會有等待的延遲感。
- `多工與並發 (Concurrency)`：龐大的記憶體讓您可以同時載入多個特定領域的強大模型，完美支援 `多個 AI 代理 (Multi-Agent)` 協作，能夠在後台並行運作而無效能瓶頸。
