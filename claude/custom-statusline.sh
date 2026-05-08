#!/bin/bash

# 讀取 Claude 傳入的 JSON 資料
input=$(cat)

# 1. 解析基礎資訊
model=$(echo "$input" | jq -r '.model.display_name // "N/A"')
context_per=$(echo "$input" | jq -r '.contextUsagePercent // 0')


context_window_size=$(echo "$input" | jq -r '.context_window.context_window_size // 0')

cost=$(echo "$input" | jq -r '.sessionCost // 0')
tokens=$(echo "$input" | jq -r '.totalTokens // 0')
branch=$(git branch --show-current 2>/dev/null || echo "no-git")

# 2. 解析 Rate Limits (5h, 7d)
limit_5h=$(echo "$input" | jq -r '.rateLimits.fiveHour.remainingPercent // "N/A"')
limit_7d=$(echo "$input" | jq -r '.rateLimits.sevenDay.remainingPercent // "N/A"')

# 3. 解析 Effort, Thinking Mode & Plan Mode
effort=$(echo "$input" | jq -r '.config.thinkingEffort // "standard"')
thinking=$(echo "$input" | jq -r 'if .isThinking then "🧠" end')
plan_mode=$(echo "$input" | jq -r 'if .inPlanMode then "📋" end')

# 4. 格式化輸出
# 使用 ANSI Color 增加可讀性
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 根據 Context 比例決定顏色
if (( $(echo "$context_per > 80" | bc -l) )); then ctx_color=$RED; 
elif (( $(echo "$context_per > 50" | bc -l) )); then ctx_color=$YELLOW; 
else ctx_color=$GREEN; fi

printf "${GREEN}[$model]${NC} | 🌿 $branch | ${context_window_size} ${ctx_color}Ctx: ${context_per}%%${NC} | ⏳ 5h: ${limit_5h}%% 7d: ${limit_7d}%% | 💰 \$${cost} (${tokens}t) | ⚡ Effort: $effort | $plan_mode $thinking"
