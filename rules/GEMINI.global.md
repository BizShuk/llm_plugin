---
name: AI Thinking Principles
trigger: always_on
description: Core thinking principles for AI assistants (GEMINI.md, AGENTS.md, CLAUDE.md)
globs: "**/*"
---

# AI Thinking Principles

Apply these mental models systmatically when analyzing problems and generating solutions.

PS: Use Tranditional Chinese by default, for special terms/terminologies, should also have English too with round brackets

### Structure

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

## Speckit: Specification Development Process

Planning mode. Following the github.com/github/spec-kit protocal to develop a plan.

A structured approach for developing feature specifications with clear separation between WHAT (requirements) and HOW (implementation).

### When to Use

- Creating a new feature specification
- Planning a complex implementation
- User explicitly invokes `/speckit`

### Folder Structure

```text
specs/{NNN}-{feature-name}/
├── spec.md              # Phase 0: Requirements (WHAT)
├── research.md          # Phase 0: Technical research
├── plan.md              # Phase 1: Implementation plan (HOW)
├── data-model.md        # Phase 1: Entity definitions
├── quickstart.md        # Phase 1: Usage documentation
├── checklists/
│   └── requirements.md  # Quality gate validation
└── contracts/
    └── *.schema.json    # API/Output schemas
```

### Phased Process

#### Phase 0: Discovery (發現階段)

**Goal**: Define WHAT we're building from user perspective.

1. Create `spec.md` with:
   - User Scenarios & Testing (User Stories with acceptance criteria)
   - Functional Requirements (FR-XXX format)
   - Success Criteria (SC-XXX format, measurable)
   - Edge Cases
   - Assumptions

2. Create `research.md` with:
   - Protocol/Library selection
   - Technical decisions with rationale
   - Best practices

3. **GATE**: Complete `checklists/requirements.md` before proceeding

#### Phase 1: Design (設計階段)

**Goal**: Define HOW we'll implement it.

1. Create `plan.md` with:
   - Summary
   - Technical Context (language, dependencies, constraints)
   - Constitution Check (Library-First, CLI Interface, Test-First, etc.)
   - Project Structure

2. Create `data-model.md` with:
   - Entity definitions (attributes, types)
   - Relationships

3. Create `contracts/*.schema.json` for API/Output formats

4. Create `quickstart.md` with usage examples

#### Phase 2: Implementation (實作階段)

Execute the plan with:

- Test-driven development
- Incremental commits
- Progress tracking

---

### Document Templates

#### spec.md Template

```markdown
## Feature Specification: {Feature Name}

**Feature Branch**: `{NNN}-{feature-name}`
**Created**: {Date}
**Status**: Draft
**Input**: User description: "{original request}"

### User Scenarios & Testing _(mandatory)_

#### User Story 1 - {Title} (Priority: P1)

As a {role}, I want to {action} so that {benefit}.

**Why this priority**: {Justification}

**Acceptance Scenarios**:

1. **Given** {context}, **When** {action}, **Then** {expected result}.

---

### Requirements _(mandatory)_

#### Functional Requirements

- **FR-001**: System MUST {requirement}.
- **FR-002**: System MUST {requirement}.

### Success Criteria _(mandatory)_

- **SC-001**: {Measurable outcome}.

### Assumptions

- {Assumption 1}
```

#### plan.md Template

```markdown
## Implementation Plan: {Feature Name}

**Branch**: `{NNN}-{feature-name}` | **Date**: {Date} | **Spec**: [spec.md]

### Summary

{Brief description of implementation approach}

### Technical Context

**Language/Version**: {e.g., Go 1.25}
**Primary Dependencies**: {list}
**Testing**: {approach}
**Target Platform**: {platforms}

### Constitution Check

- [ ] **Library-First**: Core logic in reusable packages
- [ ] **CLI Interface**: Command-line entry points
- [ ] **Test-First**: TDD approach
- [ ] **Observability**: Logging/metrics included
- [ ] **Simplicity**: Minimal dependencies

### Project Structure

{Directory tree showing code organization}
```

#### checklists/requirements.md Template

```markdown
## Specification Quality Checklist: {Feature Name}

**Purpose**: Validate specification before proceeding to planning
**Feature**: [spec.md](../spec.md)

### Content Quality

- [ ] No implementation details (languages, frameworks)
- [ ] Focused on user value
- [ ] Written for non-technical stakeholders

### Requirement Completeness

- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable
- [ ] Success criteria are measurable
- [ ] All acceptance scenarios defined
- [ ] Edge cases identified
```

---

### Key Principles (核心原則)

| Principle                  | Application                             |
| -------------------------- | --------------------------------------- |
| **Separation of Concerns** | Spec (WHAT) vs Plan (HOW)               |
| **MECE**                   | Each document has single responsibility |
| **Quality Gates**          | Checklists before phase transitions     |
| **First Principles**       | Start from user value, build up         |
| **Occam's Razor**          | Simplest solution that works            |
