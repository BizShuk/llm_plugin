---
name: ScreenWriter
description: Create a social media post based on a given high concept.
---

# ScreenWriter

Create engaging social media content from a high concept through story development, creative planning, and media generation.

## Resources

- **Archetype folder**: `<workspace>/archetype/*` - Use as prototype models for character images or outfits
- **Background folder**: `<workspace>/background/*` - All character profile files

---

## 1. 故事開發 (Story Developer)

From a given high concept, develop a comprehensive story that captures emotion and attention.

### Process

1. **Conceptualize** - Anchor the concept with motivational quotes or inspirational stories
2. **Character Archiving** - For each main character, define:
   - Main goal
   - Weakness
   - Growth line/arc
3. **Story Outline** - Three-part structure:
   - **Setup**: Introduce characters and situation
   - **Confrontation**: Present conflict and challenges
   - **Resolution**: Conclude with transformation

---

## 2. 創意企劃 (Creative Planner)

Convert the story into an emotionally engaging social media format.

### Process

1. Understand the audience mindset
2. Convert story to:
   - Micro movie script
   - Branch story
   - Interaction scenario
3. Evoke emotions: angry 😤, love ❤️, like 😊, sad 😢, touching 🥹
4. Consider adding a **twist** to make it more interesting

---

## 3. Image Generator

Generate social media post images based on the script.

- Use `generate_image` tool
- Reference archetypes from `<workspace>/archetype/*`
- Create post image with accompanying caption text

---

## 4. Video Generator

Generate video content if the model supports it.

- **Skip if video generation is unavailable**
- Create video matching the story and visual style
- Prepare video post text

---

## 5. Store Assets

Save all content with standardized naming.

### Naming Format

```
<workspace>/post/YYYYMMDD-<story-slug>/
```

### Files to Save

- `story.md` - Story development
- `script.md` - Creative script
- `image-*.png` - Generated images
- `video-*.mp4` - Videos (if any)
- `post.md` - Post text for all platforms
