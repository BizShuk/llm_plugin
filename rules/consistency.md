---
name: Context Consistency
trigger: always_on
description: Maintain consistency across business logic, character profiles, and behaviors
---

# Context Consistency

Across all files in workspace, everything should be consistent. Apply these consistency checks when creating or modifying content.

---

## Business Logic Consistency

Ensure logical coherence across the entire system:

| Aspect               | Check                                         |
| -------------------- | --------------------------------------------- |
| **Domain Rules**     | Business rules don't contradict each other    |
| **Data Flow**        | Input/output formats match between components |
| **State Management** | State transitions are valid and documented    |
| **Error Handling**   | Error codes and messages are standardized     |
| **Naming**           | Same concepts use same terminology everywhere |

### Questions to Ask

- Does this logic align with existing business rules?
- Are there conflicting behaviors in other modules?
- Is this the same pattern used elsewhere?

---

## Character Profile Consistency

Maintain coherent character identities across content:

| Element           | Consistency Check                          |
| ----------------- | ------------------------------------------ |
| **Voice & Tone**  | Speaking style matches established persona |
| **Background**    | History and origin story don't contradict  |
| **Relationships** | Character connections are bidirectional    |
| **Motivations**   | Actions align with stated goals            |
| **Knowledge**     | Character knows what they should know      |

### Character Attributes to Track

- **Core Traits** - Personality fundamentals that don't change
- **Growth Arc** - How character evolves over time
- **Limitations** - What the character cannot or will not do
- **Quirks** - Unique behaviors that define the character

---

## Behavioral Consistency

Ensure actions and reactions are predictable and coherent:

### Response Patterns

| Situation      | Expected Behavior                   |
| -------------- | ----------------------------------- |
| Similar inputs | Should produce similar outputs      |
| Edge cases     | Should follow established rules     |
| Errors         | Should fail in consistent ways      |
| Success        | Should confirm in consistent format |

### Behavioral Rules

1. **Predictability** - Same context → same behavior
2. **Proportionality** - Response matches stimulus intensity
3. **Continuity** - Past actions inform future behavior
4. **Boundaries** - Defined limits are always respected

---

## Cross-Reference Checklist

Before finalizing any content:

- [ ] Terminology matches glossary/existing usage
- [ ] Character actions align with their profile
- [ ] Business rules don't conflict with existing ones
- [ ] Tone matches the established voice
- [ ] Data formats are compatible
- [ ] Error handling follows standards
- [ ] References to other content are accurate
