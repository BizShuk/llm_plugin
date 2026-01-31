#!/bin/bash


#!/bin/bash

mkdir ~/.agent
ln -s ~/.agent ~/.gemini
ln -s ~/.agent ~/.claude


# Default Antigravity Gemini Link
mkdir -p ~/.gemini/antigravity
mkdir -p ~/.gemini/rules
mkdir -p ~/.gemini/skills
mkdir -p ~/.gemini/workflows

ln -s ~/.gemini/skills ~/.gemini/antigravity/global_skills
ln -s ~/.gemini/workflows ~/.gemini/antigravity/global_workflows

# Global Config Alias
ln -s ~/.gemini ./config/
ln -s ~/.agent  ./config/
ln -s ~/.claude ./config/

# Global Skills
ln -s ~/projects/llm_plugin/skills/project-metadata ~/.gemini/antigravity/global_skills/


# Global Rules
ln -s ~/projects/llm_plugin/rules/GEMINI.global.md ./config/.gemini/GEMINI.md

# Projects Social Platform
ln -s ~/projects/llm_plugin/rules/go-* ./projects/social_platform/rules/

# Project Alias