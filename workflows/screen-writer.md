---
name: ScreenWriter
description: Create social media content from a high concept through story development, creative planning, and media generation
---

# ScreenWriter Workflow

Create engaging social media posts by developing stories, crafting emotional scenarios, and generating visual content.

## Resources

- **Archetype folder**: `<workspace>/archetype/*` - Use as prototype models for character images or outfits
- **Background folder**: `<workspace>/background/*` - All files are character profiles

---

## Step 1: 故事開發 (Story Developer)

Given a high concept, develop a comprehensive story to captivate the target audience.

### Instructions

1. **Conceptualize** - Attach the concept with motivational quotes or inspirational stories to anchor the narrative
2. **Character Archiving** - Define for each main character:
   - Main goal
   - Weakness
   - Growth arc/line
3. **Story Outline** - Structure the story in 3 parts:
   - **Setup**: Introduce characters, world, and initial situation
   - **Confrontation**: Present conflict, challenges, and tension
   - **Resolution**: Conclude with transformation or outcome

### Output

Document the story foundation including:
- Core concept with inspirational anchor
- Character profiles with goals, weaknesses, and growth arcs
- Three-part outline

---

## Step 2: 創意企劃 (Creative Planner)

Convert the developed story into an emotionally engaging format for social media.

### Instructions

1. **Understand Audience Mindset** - Consider what emotions resonate with your target audience
2. **Convert Story** - Transform into one of these formats:
   - Micro movie script
   - Branch story (interactive narrative)
   - Interaction scenario
3. **Emotional Core** - Ensure the story evokes genuine emotions:
   - Anger 😤
   - Love ❤️
   - Like/Joy 😊
   - Sadness 😢
   - Touching/Moving 🥹
4. **Add Twist** - Reflect on whether a twist can make the story more interesting and memorable

### Output

A creative script/scenario with:
- Clear emotional arc
- Engaging format suitable for social media
- Optional twist element

---

## Step 3: Image Generator

Generate social media post images based on the story and script.

### Instructions

1. Use the `generate_image` tool to create visual content
2. Reference character archetypes from `<workspace>/archetype/*` for consistent character design
3. Match the emotional tone established in the creative plan
4. Create images suitable for social media posting

### Output

- Generated image(s) for the post
- Accompanying post text/caption

---

## Step 4: Video Generator

Generate video content if the model supports video generation.

### Instructions

1. **Check Capability** - If the model cannot generate video, **skip this step**
2. If video generation is available:
   - Create video based on the story and script
   - Match the visual style of generated images
   - Include appropriate transitions and pacing
3. Prepare video post text

### Output (if applicable)

- Generated video
- Video post text/caption

---

## Step 5: Store Assets

Save all generated content with standardized naming.

### Naming Convention

```
YYYYMMDD-<story-slug>
```

Example: `20260130-journey-of-hope`

### Instructions

1. Create folder: `<workspace>/post/YYYYMMDD-<story-slug>/`
2. Store all assets:
   - `story.md` - Story development document
   - `script.md` - Creative plan/script
   - `image-*.png` - Generated images
   - `video-*.mp4` - Generated videos (if any)
   - `post.md` - Final post text for all platforms

### Output

All content organized in the post folder with proper naming.
