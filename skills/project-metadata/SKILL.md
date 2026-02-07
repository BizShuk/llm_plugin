---
name: project-metadata
description: Project structure initialization and metadata generation. This skill should be used when creating a new project, initializing project structure based on type (golang or social profile), or generating/updating README documentation.
---

# Project Metadata

## Overview

This skill provides project initialization and metadata (README.md) generation based on project type. It supports structured initialization for golang and social profile projects.

## When to Use

Use this skill when:

- Creating a new project and need to initialize its structure
- Generating or updating README documentation for golang projects
- Setting up a social profile workspace

## Supported Project Types

| Type      | Structure Reference          | Metadata Reference             |
| --------- | ---------------------------- | ------------------------------ |
| `default` | N/A (analyzes existing)      | `references/default.readme.md` |
| `golang`  | `rules/go-structure.md`      | `references/golang.readme.md`  |
| `profile` | `rules/profile-structure.md` | `references/profile.readme.md` |

**Note:** If no project type is specified, the `default` type is used, which analyzes the existing project structure and generates a comprehensive README.md with folder descriptions.

---

## Project Initialization

### Golang Projects

To initialize a golang project structure, follow the guidelines in `rules/go-structure.md`:

```
<project-name>/
├── cmd/        # CLI entry points (spf13/cobra)
├── config/     # Configuration and client initialization
├── model/      # Database CRUD operations
├── svc/        # Single domain business logic
├── handler/    # E2E feature orchestration
└── utils/      # Common helper functions
```

### Social Profile Projects

To initialize a social profile project structure, follow the guidelines in `rules/profile-structure.md`:

```
<project-name>/
├── archetype/   # Prototype models for the profile
├── background/  # Profile information and details
├── post/        # Generated posts (YYYYMMDD-<story> naming)
└── assets/      # Non-defined files
```

---

## Metadata Generation

### Default README (Any Project Type)

To generate README documentation for any project, use the workflow defined in `references/default.readme.md`.

This is the **default workflow** when no specific project type is provided. It works for any codebase by:

1. **Identifying Project Type** - Detects language and framework from files
2. **Traversing Domain Folders** - Analyzes top-level folders (excluding infrastructure)
3. **Analyzing Configuration** - Extracts info from package files and configs
4. **Finding Entry Points** - Discovers how to run, build, and test
5. **Understanding Purpose** - Infers project goals from structure and docs
6. **Generating README** - Creates comprehensive documentation

The workflow provides detailed descriptions for each domain folder, helping newcomers understand the project structure quickly.

Read the full reference for detailed steps:

```
references/default.readme.md
```

### Golang README

To generate README documentation for a golang project, use the workflow defined in `references/golang.readme.md`.

The workflow analyzes:

1. **Folder Structure** - Documents key directories and their purposes
2. **Handler List** - HTTP/RPC endpoints with methods and descriptions
3. **External Services** - RPC, Database, Cache, MQ dependencies
4. **Run/Test Instructions** - Build, run, and testing commands

Read the full reference for detailed steps:

```
references/golang.readme.md
```

### Social Profile Metadata

To generate README documentation for a social profile project, use the workflow defined in `references/profile.readme.md`.

The workflow analyzes:

1. **Profile Overview** - Name, type, and description
2. **Directory Structure** - Standard profile directories
3. **Background Information** - Biography, personality, voice from `background/`
4. **Archetype References** - Prototype models from `archetype/`
5. **Post List** - All posts from `post/` with dates and content types

Read the full reference for detailed steps:

```
references/profile.readme.md
```

---

## Resources

### references/

| File                | Description                            |
| ------------------- | -------------------------------------- |
| `default.readme.md` | Workflow for default README generation |
| `golang.readme.md`  | Workflow for golang README generation  |
| `profile.readme.md` | Workflow for profile README generation |
