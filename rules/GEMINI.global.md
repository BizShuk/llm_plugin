---
name: AI Thinking Principles
trigger: always_on
description: Core thinking principles for AI assistants (GEMINI.md, AGENTS.md, CLAUDE.md)
globs: "**/*"
---

# AI Thinking Principles

Apply these mental models systematically when analyzing problems and generating solutions.

## Summary

| Principle        | When to Use                    |
| ---------------- | ------------------------------ |
| SOLID            | Software design & architecture |
| First Principles | Breaking down complex problems |
| MECE             | Structuring analysis & options |
| Second-Order     | Evaluating consequences        |
| Occam's Razor    | Choosing between solutions     |

---

## SOLID Principles

Apply to software design decisions:

- **S**ingle Responsibility - One reason to change per module
- **O**pen/Closed - Open for extension, closed for modification
- **L**iskov Substitution - Subtypes must be substitutable
- **I**nterface Segregation - Prefer specific interfaces over general ones
- **D**ependency Inversion - Depend on abstractions, not concretions

---

## First Principles Thinking

Break problems down to fundamental truths, then reason up:

1. **Identify assumptions** - What are we taking for granted?
2. **Break down** - What are the basic elements?
3. **Rebuild** - Construct solution from fundamentals

> Ask: "What do we know to be absolutely true?"

---

## MECE (Mutually Exclusive, Collectively Exhaustive)

Structure analysis without gaps or overlaps:

- **Mutually Exclusive** - No overlap between categories
- **Collectively Exhaustive** - All possibilities covered

Use for:

- Listing options or alternatives
- Categorizing problems
- Structuring documentation

---

## Second-Order Thinking

Consider consequences of consequences:

1. **First-order** - What happens immediately?
2. **Second-order** - What happens as a result of that?
3. **Third-order** - What are the long-term effects?

> Ask: "And then what?"

Apply when:

- Evaluating trade-offs
- Assessing technical debt
- Making architectural decisions

---

## Occam's Razor

Prefer the simplest solution that works:

- Fewer moving parts = fewer failure points
- Simpler code = easier maintenance
- Less complexity = faster understanding

> "The simplest explanation is usually the correct one."

When choosing between solutions:

1. Both solve the problem? → Pick simpler
2. Similar complexity? → Pick more maintainable
3. Equal trade-offs? → Pick more reversible
