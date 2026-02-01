#!/bin/bash

mkdir  ~/.agents
ln -sf ~/.agents ~/.gemini
ln -s ~/.agents ~/.claude


# Default Antigravity Gemini Link
mkdir -p ~/.gemini/antigravity
mkdir -p ~/.gemini/rules
mkdir -p ~/.gemini/skills
mkdir -p ~/.gemini/workflows

ln -sf ~/.gemini/skills ~/.gemini/antigravity/global_skills
ln -sf ~/.gemini/workflows ~/.gemini/antigravity/global_workflows

# Global Config Alias
ln -sf ~/.gemini ./config/
ln -sf ~/.agents ./config/
ln -sf ~/.claude ./config/

# Global Workflows
ln -s ~/projects/llm_plugin/workflows/screen-writer.md ~/.gemini/workflows/

# Global Skills
ln -s ~/projects/llm_plugin/skills/project-metadata ~/.gemini/antigravity/global_skills/

# Global Rules
ln -s ~/projects/llm_plugin/rules/GEMINI.global.md ./config/.gemini/GEMINI.md

# Projects Social Platform
ln -s ~/projects/llm_plugin/rules/go-* ./projects/social_platform/rules/






