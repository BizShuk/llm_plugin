#!/bin/bash

mkdir  ~/.agents
ln -sfh ~/.agents ~/.gemini
ln -sfh ~/.agents ~/.agent
ln -sh ~/.agents ~/.claude


# Default Antigravity Gemini Link
mkdir -p ~/.gemini/antigravity
mkdir -p ~/.gemini/rules
mkdir -p ~/.gemini/skills
mkdir -p ~/.gemini/workflows

ln -sfh ~/.gemini/skills ~/.gemini/antigravity/global_skills
ln -sfh ~/.gemini/workflows ~/.gemini/antigravity/global_workflows

# Global Config Alias
mkdir -p ./config
ln -sfh ~/.gemini ./config/
ln -sfh ~/.agents ./config/
ln -sfh ~/.claude ./config/
ln -sfh ~/.claude.json ./config/

# Global Workflows
ln -sfh ~/projects/llm_plugin/workflows/screen-writer.md ~/.gemini/workflows/

# Global Rules
ln -sfh ~/projects/llm_plugin/rules/GEMINI.global.md ./config/.gemini/GEMINI.md
