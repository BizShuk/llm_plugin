#!/bin/bash


mkdir -p ~/.gemini/antigravity
mkdir -p ~/.gemini/rules
mkdir -p ~/.gemini/skills
mkdir -p ~/.gemini/workflows

ln -s ~/.gemini/skills ~/.gemini/antigravity/global_skills
ln -s ~/.gemini/workflows ~/.gemini/antigravity/global_workflows

ln -s $(pwd)/rules/GEMINI.global.md ~/.gemini/GEMINI.md