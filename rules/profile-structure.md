---
name: Profile Structure
trigger: always_on
description: This is social profile project structure
globs: "**/archetype/**,**/background/**,**/post/**"
---

# Profile Structure

Social profile projects are used for managing personas, characters, or personal brands for content creation, storytelling, and social media management.

## Summary

| Directory     | Responsibility                                        |
| ------------- | ----------------------------------------------------- |
| `archetype/`  | Prototype models for the profile                      |
| `background/` | Profile information, biography, and details           |
| `post/`       | Generated posts and content (YYYYMMDD-<story> naming) |
| `assets/`     | Non-defined files and miscellaneous resources         |

---

### Archetype (`archetype/`)

- **Responsibility**: Store prototype and reference models for the social profile.

Use cases:

- Character archetypes for fictional personas
- Reference images for visual style
- Personality templates and traits
- Ideal self representations for personal brands

When to use:

- When the profile represents a non-real person (fictional character)
- When the person wants to define an aspirational version of themselves
- When establishing visual or behavioral prototypes

### Background (`background/`)

- **Responsibility**: Store all detailed information and backstory for the profile.

Contents include:

- Character biography and history
- Personality traits and values
- Relationships and connections
- Skills, interests, and expertise
- Voice and communication style
- Background stories and context

- **Example files**:
  - `bio.md` - Core biography and identity
  - `personality.md` - Traits, values, and behavioral patterns
  - `voice.md` - Communication style and tone guidelines
  - `relationships.md` - Key relationships and social context

### Post (`post/`)

- **Responsibility**: Store all generated content and posts.
- **Naming convention**: Use `YYYYMMDD-<story>` format for organizing posts by date and topic.

Contents include:

- Social media posts (text, images, videos)
- Generated scripts and scenarios
- Content drafts and iterations
- Published content archives

- **Example structure**:

  ```
  post/
  ├── 20260131-dinner-gathering/
  │   ├── script.md
  │   ├── image.png
  │   └── caption.txt
  └── 20260130-morning-routine/
      ├── story.md
      └── assets/
  ```

### Assets (`assets/`)

- **Responsibility**: Store miscellaneous files that don't fit other categories.

Contents include:

- Fonts and typography files
- Raw media files
- Temporary resources
- External references
- Non-categorized materials

---

## Initialization

To initialize a new social profile project:

```bash
mkdir -p <project-name>/{archetype,background,post,assets}
```

## Integration with ScreenWriter Workflow

When used with the ScreenWriter workflow:

- Store character profiles in `background/`
- Use `archetype/` for prototype models for character images or outfits
- Generated content goes to `post/` with `YYYYMMDD-<story>` naming
