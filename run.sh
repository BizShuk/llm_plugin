#!/bin/bash

mkdir ~/.agent
ln -sfh ~/.agent ~/.agents


# Default Antigravity Gemini Link
mkdir -p ~/.gemini/antigravity
mkdir -p ~/.gemini/skills
mkdir -p ~/.gemini/workflows

ln -sfh ~/.gemini/skills ~/.gemini/antigravity/skills
ln -sfh ~/.gemini/workflows ~/.gemini/antigravity/global_workflows

# Global Config Alias
mkdir -p ./config
ln -sfh ~/.gemini ./config/
ln -sfh ~/.agent ./config/
ln -sfh ~/.claude ./config/
ln -sfh ~/.claude.json ./config/

# Global Rules
ln -sfh ~/projects/llm_plugin/rules/GEMINI.global.md ./config/.gemini/GEMINI.md
ln -sfh ~/projects/llm_plugin/rules/structure.global.md ~/.agent/rules/structure.global.md
ln -sfh ~/projects/llm_plugin/rules/structure.project.md ~/.agent/rules/structure.project.md

# skill using npx skills add to operate