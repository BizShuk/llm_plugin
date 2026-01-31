---
name: Generate README - Profile
description: Generate comprehensive README documentation for social profile projects with directory structure, profile information, and post listing
---

# Generate README - Profile Workflow

This workflow generates documentation for social profile projects based on the profile-structure rules.

## Step 1: Document Profile Overview

Create an overview section with:

| Item         | Source                     |
| ------------ | -------------------------- |
| Profile Name | Project directory name     |
| Type         | Fictional / Personal Brand |
| Description  | Brief profile summary      |

## Step 2: Document Directory Structure

List the standard profile directories:

| Directory     | Purpose                                       |
| ------------- | --------------------------------------------- |
| `archetype/`  | Prototype models for the profile              |
| `background/` | Profile information, biography, and details   |
| `post/`       | Generated posts (YYYYMMDD-<story> naming)     |
| `assets/`     | Non-defined files and miscellaneous resources |

## Step 3: Extract Background Information

Scan `background/` directory and document key profile details:

- `bio.md` - Core biography and identity
- `personality.md` - Traits, values, and behavioral patterns
- `voice.md` - Communication style and tone guidelines
- `relationships.md` - Key relationships and social context

Create a summary table:

| File           | Status  | Key Points           |
| -------------- | ------- | -------------------- |
| bio.md         | Present | [Extract key points] |
| personality.md | Missing | -                    |

## Step 4: List Archetype References

Scan `archetype/` directory for prototype models:

| File/Folder | Type   | Description             |
| ----------- | ------ | ----------------------- |
| persona.md  | Text   | Character archetype     |
| style/      | Images | Visual style references |

## Step 5: Generate Post List

Scan `<workspace>/post/` directory and list all posts:

| Date       | Story Name       | Content Types          | Status    |
| ---------- | ---------------- | ---------------------- | --------- |
| 2026-01-31 | dinner-gathering | script, image, caption | Published |
| 2026-01-30 | morning-routine  | story                  | Draft     |

Post naming convention: `YYYYMMDD-<story>/`

Include statistics:

- Total posts: [count]
- Date range: [earliest] to [latest]
- Content types: [list unique types]

## Step 6: Generate README.md

Compile all gathered information into a well-structured README.md:

---

## Output Format Example

```markdown
# [Profile Name]

## Overview

Brief description of the profile.

| Attribute   | Value                |
| ----------- | -------------------- |
| Type        | Fictional / Personal |
| Created     | YYYY-MM-DD           |
| Last Update | YYYY-MM-DD           |

## Profile Background

Summary of profile information from `background/` directory.

### Biography

[Key points from bio.md]

### Personality

[Key points from personality.md]

### Voice & Style

[Key points from voice.md]

## Archetype References

| Reference  | Description         |
| ---------- | ------------------- |
| persona.md | Character archetype |
| style/     | Visual references   |

## Posts

| Date       | Story            | Content       |
| ---------- | ---------------- | ------------- |
| 2026-01-31 | dinner-gathering | script, image |
| 2026-01-30 | morning-routine  | story         |

**Total Posts:** 2  
**Date Range:** 2026-01-30 to 2026-01-31

## Directory Structure

\`\`\`
<profile-name>/
├── archetype/
├── background/
│ ├── bio.md
│ └── personality.md
├── post/
│ ├── 20260131-dinner-gathering/
│ └── 20260130-morning-routine/
└── assets/
\`\`\`
```
