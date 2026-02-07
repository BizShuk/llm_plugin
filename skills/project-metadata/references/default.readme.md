---
name: Default README.md
description: Analyze workspace and generate comprehensive README documentation for general projects with folder descriptions and project overview
---

# Default README.md

This skill analyzes any project and generates comprehensive documentation in README.md, focusing on understanding the overall project structure and purpose of each domain folder.

## Step 1: Identify Project Root and Type

Determine the project root directory and infer the project type based on:

- **Language indicators**: `package.json`, `go.mod`, `requirements.txt`, `Cargo.toml`, etc.
- **Framework markers**: `.next/`, `vite.config.js`, `Dockerfile`, etc.
- **Project patterns**: Presence of specific folder structures

Document:

- Project name (from directory name or package file)
- Primary language/framework
- Project type (web app, CLI tool, library, plugin system, etc.)

## Step 2: Traverse Domain Folders

Scan the project directory structure at the **top level** and identify all domain folders (excluding common infrastructure folders).

**Skip these infrastructure folders:**

- `.git`, `.github`, `.vscode`, `.idea`
- `node_modules`, `vendor`, `venv`, `.env`
- `dist`, `build`, `output`, `target`
- Hidden folders (starting with `.`)

**Focus on domain folders like:**

- `src/`, `lib/`, `app/`
- `cmd/`, `bin/`, `scripts/`
- `config/`, `settings/`
- `docs/`, `examples/`
- `tests/`, `test/`
- `plugins/`, `skills/`, `workflows/`
- `models/`, `services/`, `handlers/`
- `public/`, `static/`, `assets/`
- Any custom domain folders

For each domain folder, document:

| Column      | Description                                                   |
| ----------- | ------------------------------------------------------------- |
| Folder Path | Relative path from project root                               |
| Type        | Domain category (core, config, docs, tools, tests, etc.)      |
| Purpose     | Brief description of what the folder contains and its role    |
| Key Files   | Notable files or subdirectories (limit to 3-5 most important) |

## Step 3: Analyze Key Configuration Files

Identify and document important configuration files:

- `package.json`, `go.mod`, `requirements.txt` - Dependencies
- `README.md`, `CONTRIBUTING.md` - Existing documentation
- `Dockerfile`, `docker-compose.yml` - Containerization
- `.env.example`, `config.yaml` - Configuration templates
- `Makefile`, `build.sh` - Build scripts

Extract:

- Project name and version
- Main dependencies
- Scripts/commands available
- Entry points

## Step 4: Identify Entry Points and Commands

Find how to run the project:

**For different project types:**

- **Node.js**: Check `package.json` scripts section
- **Go**: Look for `main.go` in `cmd/` or root
- **Python**: Find `__main__.py`, `setup.py`, or CLI entry points
- **Rust**: Check `Cargo.toml` for binary targets
- **Shell scripts**: Look for `run.sh`, `start.sh`, etc.

Document:

| Command      | Description                    |
| ------------ | ------------------------------ |
| Installation | How to install dependencies    |
| Build        | How to build the project       |
| Run          | How to run the project         |
| Test         | How to run tests               |
| Development  | How to run in development mode |

## Step 5: Understand Project Purpose

Based on the analysis, infer the project's purpose:

1. **Read existing README** (if present) for context
2. **Analyze folder structure** to understand architecture
3. **Check package descriptions** in manifest files
4. **Look for documentation** in `docs/` or comments
5. **Examine entry points** to understand main functionality

Write a concise overview (2-4 paragraphs) covering:

- What the project does
- Who it's for
- Key features or capabilities
- Architecture approach (if applicable)

## Step 6: Generate README.md

Compile all gathered information into a well-structured README.md file with:

1. **Project Title** - Name and brief tagline
2. **Overview** - Project purpose and description
3. **Project Structure** - Domain folder descriptions table
4. **Getting Started** - Installation and setup
5. **Usage** - How to run and use the project
6. **Configuration** - Key configuration files and options
7. **Development** - How to contribute or develop
8. **Testing** - How to run tests (if applicable)

---

## Output Format Example

````markdown
# Project Name

> Brief tagline describing the project

## Overview

This project provides [main functionality]. It is designed for [target users/use case].

Key features:

- Feature 1
- Feature 2
- Feature 3

## Project Structure

| Folder       | Type   | Purpose                          | Key Files                   |
| ------------ | ------ | -------------------------------- | --------------------------- |
| `src/`       | Core   | Main application source code     | `index.js`, `app.js`        |
| `config/`    | Config | Configuration files and settings | `default.json`, `env.js`    |
| `plugins/`   | Domain | Extensible plugin system         | `ding/`, `plan/`            |
| `skills/`    | Domain | AI agent skills and capabilities | `skill_generator/`          |
| `workflows/` | Tools  | Automation workflows and scripts | `screen-writer.md`          |
| `tests/`     | Tests  | Unit and integration tests       | `unit/`, `integration/`     |
| `docs/`      | Docs   | Documentation and guides         | `API.md`, `ARCHITECTURE.md` |

## Getting Started

### Prerequisites

- Node.js 18+ (or other requirements)
- npm or yarn

### Installation

```bash
npm install
```
````

### Configuration

Copy the example configuration:

```bash
cp .env.example .env
```

Edit `.env` with your settings.

## Usage

### Running the Project

```bash
npm start
```

### Development Mode

```bash
npm run dev
```

### Building

```bash
npm run build
```

## Testing

```bash
npm test
```

## Configuration

Key configuration files:

- `config/default.json` - Default settings
- `.env` - Environment variables
- `settings.json` - User preferences

## Development

[Add contribution guidelines, coding standards, etc.]

## License

[License information]

```

---

## Notes

- **Be thorough but concise**: Provide enough detail to understand each folder's purpose without overwhelming the reader
- **Infer intelligently**: Use file names, folder structure, and code patterns to understand purpose
- **Prioritize clarity**: Use clear, descriptive language that helps newcomers understand the project
- **Stay current**: Focus on active folders and files, not deprecated or unused code
- **Adapt to context**: Adjust the README structure based on project type and complexity
```
