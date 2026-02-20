---
name: Create Skill From Repo
description: Create a skill from a repository URL.
user-invocable: true
auto-invoke: true
version: "1.0.0"
capabilities: ["mcp", "terminal"]
---

# Create Skill From Repo

Create <skill_name> skill from this repo <repo_link>.

- clone the repo and do full project analysis
- create a skill in workspace.
- SKILL.md should follow this format:

```markdown
# <skill_name>

## <function 1>

<description>

### parameters

(each parameter should have a default value)

### system dependency

(how to get system dependency to let agent/llm can check)

### 目錄結構 (Folder Structure)

context_only: (僅在功能需要輸出數據時才需要 / Required only when the function needs to output data)

### 檔案內容模板 (File Content Template)

context_only: (僅在功能需要輸出數據時才需要 / Required only when the function needs to output data)

## <function 2>

...
```
