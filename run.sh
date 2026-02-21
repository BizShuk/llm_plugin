#!/bin/bash

mkdir -p ~/.agent
ln -sfh ~/.agent ~/.agents


# Default Antigravity Gemini Link
mkdir -p ~/.gemini/antigravity
mkdir -p ~/.gemini/skills
mkdir -p ~/.gemini/workflows

ln -sfh ~/.agents/skills ~/.gemini/antigravity/skills
ln -sfh ~/.agents/skills ~/.gemini/skills
ln -sfh ~/.agents/workflows ~/.gemini/antigravity/global_workflows

# Global Config Alias
mkdir -p ./config
ln -sfh ~/.gemini ./config/
ln -sfh ~/.agent ./config/
ln -sfh ~/.claude ./config/
ln -sfh ~/.claude.json ./config/

# Global Rules
cp -f ~/projects/llm_plugin/rules/GEMINI.global.md ./config/.gemini/GEMINI.md
cp -f ~/projects/llm_plugin/rules/GEMINI.global.md ~/.openclaw/workspace/memory/folder_structure.md

# skill using npx skills add to operate