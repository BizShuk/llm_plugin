---
description: Create social media content from a high concept through story development, creative planning, and media generation
---

# ScreenWriter Workflow

Create engaging social media posts by developing stories, crafting emotional scenarios, and generating visual content.

## Resources

- **Archetype folder**: `<workspace>/archetype/*` - Use as prototype models for character images or outfits
- **Background folder**: `<workspace>/background/*` - All files are character profiles

---

## Mandatory Outputs

Every execution of this workflow **MUST** produce:

| File          | Description                      |
| ------------- | -------------------------------- |
| `story.md`    | Character-driven narrative prose |
| `script.md`   | Video storyboard with shot list  |
| `post.md`     | 3 social media post variations   |
| `image-1.png` | Opening/Setup visual             |
| `image-2.png` | Confrontation/Climax visual      |
| `image-3.png` | Resolution/Takeaway visual       |

---

## Step 1: 故事開發 (Story Developer) → `story.md`

Develop a comprehensive character-driven story in **pure prose format**.

### Instructions

1. **Conceptualize** - Anchor the concept with a motivational quote or inspirational story
2. **Character Archiving** - Define for each main character:
   - Main goal
   - Weakness
   - Growth arc/line
3. **Write the Story** - Structure in 3 parts as **narrative prose**:
   - **Setup**: Introduce characters, world, and initial situation
   - **Confrontation**: Present conflict, challenges, and tension
   - **Resolution**: Conclude with transformation or outcome

### Output Format: `story.md`

```markdown
# Story Title

> "Anchor quote or inspiration"

## Character Profile

- **Name**: ...
- **Goal**: ...
- **Weakness**: ...
- **Growth Arc**: ...

## Part 1: Setup

[Narrative prose describing the opening scene, character's state, environment, and initial situation. Include internal feelings and sensory details.]

## Part 2: Confrontation

[Narrative prose describing the challenge, struggle, emotional turmoil, and the character's journey through difficulty. Capture the raw feelings and internal conflict.]

## Part 3: Resolution

[Narrative prose describing the transformation, realization, or outcome. Show the emotional shift and what the character learned or became.]
```

---

## Step 2: 創意企劃 (Creative Planner) → `script.md`

Act as a **Video Director** to create a detailed storyboard and shot list.

### Instructions

1. **Understand Audience Mindset** - Consider target emotions:
   - Anger 😤 | Love ❤️ | Joy 😊 | Sadness 😢 | Touching 🥹
2. **Create Storyboard** - Break down the story into visual scenes
3. **Write Shot List** - Describe **every second** of the video:
   - Camera angle and movement
   - Subject action
   - Audio/Music cues
   - Text overlays
   - Emotional beat
4. **Add Twist** - Include a memorable twist or payoff moment

### Output Format: `script.md`

```markdown
# Video Script: [Title]

## Overview

- **Duration**: XX seconds
- **Format**: [Reel/TikTok/YouTube Short]
- **Emotional Arc**: [Start emotion] → [Peak emotion] → [End emotion]
- **Music Style**: [Describe tempo, mood, genre]

## Storyboard

### Scene 1: [Scene Name] (0:00 - 0:XX)

| Timestamp | Shot     | Camera    | Action                 | Audio        | Text Overlay           | Emotion   |
| --------- | -------- | --------- | ---------------------- | ------------ | ---------------------- | --------- |
| 0:00-0:02 | Wide     | Static    | Character enters frame | Soft ambient | None                   | Curiosity |
| 0:02-0:04 | Close-up | Slow zoom | Eyes widen             | Rising synth | "When I found this..." | Intrigue  |
| ...       | ...      | ...       | ...                    | ...          | ...                    | ...       |

### Scene 2: [Scene Name] (0:XX - 0:XX)

[Continue with same table format]

### Scene 3: [Scene Name] (0:XX - 0:XX)

[Continue with same table format]

## Key Moments

- **Hook** (0:00-0:03): [What grabs attention]
- **Climax** (0:XX): [The peak emotional moment]
- **Payoff** (0:XX): [The satisfying conclusion or twist]

## Director Notes

[Any additional guidance for filming, editing, or mood]
```

---

## Step 3: Image Generator → `image-1.png`, `image-2.png`, `image-3.png`

Generate **exactly 3 images** corresponding to the story arc.

### Instructions

1. Use the `generate_image` tool
2. Reference character archetypes from `<workspace>/archetype/*`
3. Generate images matching the emotional tone of each story part:

| Image         | Story Part    | Emotional Tone                        |
| ------------- | ------------- | ------------------------------------- |
| `image-1.png` | Setup         | Curiosity, normalcy, tension building |
| `image-2.png` | Confrontation | Intensity, struggle, climax           |
| `image-3.png` | Resolution    | Calm, wisdom, transformation          |

4. Use consistent visual style across all 3 images
5. Copy generated images to the post folder with correct naming

### Output

- `image-1.png` - Opening/Setup visual
- `image-2.png` - Confrontation/Climax visual
- `image-3.png` - Resolution/Takeaway visual

---

## Step 4: Social Media Post → `post.md`

Create **3 different posts** for the same story, optimized for different platforms/angles.

### Instructions

Write 3 variations:

1. **Post 1: Hook-Heavy** - Lead with a provocative question or bold statement
2. **Post 2: Story-Driven** - Lead with narrative and personal experience
3. **Post 3: Value-First** - Lead with the lesson or takeaway

Each post must include:

- Compelling opening line (hook)
- Body content
- Call-to-action
- Relevant hashtags

### Output Format: `post.md`

```markdown
# Social Media Posts: [Story Title]

---

## Post 1: Hook-Heavy

**Platform**: LinkedIn / Twitter

[Bold opening question or statement]

[2-3 sentences of context]

[The insight or lesson]

[Call-to-action question]

**Hashtags**: #Tag1 #Tag2 #Tag3

---

## Post 2: Story-Driven

**Platform**: Instagram / LinkedIn

[Personal narrative opening]

[What happened - the journey]

[What I learned]

[Invitation to engage]

**Hashtags**: #Tag1 #Tag2 #Tag3

---

## Post 3: Value-First

**Platform**: Twitter / Threads

[Lead with the lesson/principle]

[Brief supporting evidence]

[How to apply it]

[Engagement prompt]

**Hashtags**: #Tag1 #Tag2 #Tag3
```

---

## Step 5: Video Generator (Optional)

Generate video content if the model supports video generation.

### Instructions

1. **Check Capability** - If the model cannot generate video, **skip this step**
2. If video generation is available:
   - Create video based on `script.md` storyboard
   - Match the visual style of generated images
   - Include appropriate transitions and pacing

### Output (if applicable)

- `video-*.mp4` - Generated video files

---

## Step 6: Store Assets

Save all generated content with standardized naming.

### Naming Convention

```
YYYYMMDD-<story-slug>
```

Example: `20260130-journey-of-hope`

### Instructions

1. Create folder: `<workspace>/post/YYYYMMDD-<story-slug>/`
2. Store all assets:

| File          | Required    | Description                    |
| ------------- | ----------- | ------------------------------ |
| `story.md`    | ✅ YES      | Character narrative prose      |
| `script.md`   | ✅ YES      | Video storyboard and shot list |
| `post.md`     | ✅ YES      | 3 social media post variations |
| `image-1.png` | ✅ YES      | Setup visual                   |
| `image-2.png` | ✅ YES      | Confrontation visual           |
| `image-3.png` | ✅ YES      | Resolution visual              |
| `video-*.mp4` | ❌ Optional | Generated videos               |

### Final Checklist

Before completing the workflow, verify:

- [ ] `story.md` contains full narrative prose with feelings and struggles
- [ ] `script.md` contains second-by-second shot list with timestamps
- [ ] `post.md` contains exactly 3 post variations
- [ ] 3 images generated and saved with correct naming
- [ ] All files in correct folder: `<workspace>/post/YYYYMMDD-<story-slug>/`
