---
trigger: always_on
description: Core thinking principles for AI assistants (GEMINI.md, AGENTS.md, CLAUDE.md)
globs: "**/*"
---

# AI Principles

Apply these mental models systmatically when analyzing problems and generating solutions.

## Language

Use Traditional Chinese to reply message or descript the information/details. For name/term, should use local language with English and round brackets.

ex1: 中正紀念堂 (Chiang Kai-shek Memorial Hall)

中正紀念堂 is in Taiwan Taipei, here is using Traditional Chinese, so use it by default, but still need to attach with English as it's a name/term

ex2: Catedral de Santa Eulalia de Barcelona(Barcelona Cathedral)

## folder structure

- @~/.agent/structure.global.md
- @~/.agent/structure.project.md

## Restriction

### Generating Markdown file

Don't use **bold**, but `backtick` better to highlight

### if hit error while execution

Check the erorr and try to fix it. max retry times is 10.
if can't be resolved, the stop and error out explicitely.
