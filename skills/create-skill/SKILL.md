---
name: Create Skill
description: about agent skill management, create/update/delete skill
icon: 🚀
category: skill-management
tags: ["skill-creation", "repository"]
author: Shuk
version: "1.0.0"
---

# Create Skill

create/update/delete skill under .agents/skills/. also manage a agent skill list in <workspace>/README.md `Agent Skills` section

## Create Skill From Repository

Create <skill_name> skill from a given repository URL. It will clone the repo, perform a full project analysis, and create a skill in the workspace.

### Usage

Parameters

- `repo_link`: The URL of the repository to clone and analyze. (Default: none)

How to use this command

```bash
use create-skill with rpeo <repo_link>
use create-skill with references <references>
use create-skill to align with <exsit_skill_name>
```

### Output Folder Structure

```text
<path/to/workspace>/.agents/skills/<skill_name>/
└── SKILL.md
```

- **File Name Pattern**: A directory named `<skill_name>` containing the `SKILL.md` file.

### Output File Content

- `SKILL.md` should follow this format: `@skill.global.md`

## Create Skill From References

Create <skill_name> skill from provided reference documents or URLs instead of a full repository.

### Parameters

- `references`: A list of file paths or URLs to use as references for creating the skill. (Default: none)

### Output Folder Structure

For Create New SKill only. if just align structure, then use existing one

```text
<path/to/workspace>/.agents/skills/<skill_name>/
└── SKILL.md
```

- **File Name Pattern**: A directory named `<skill_name>` containing the `SKILL.md` file.

### Output File Content

- `SKILL.md` should follow this format: `@skill.global.md`
