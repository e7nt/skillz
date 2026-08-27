---
name: ex-viz
description: Explain a topic like I am a noob with a dead-simple HTML picture explainer. Use when the user types /ex-viz <topic>, says “explain visually”, or asks for a simple visual explanation of how something works.
---

# Explain Visually

Use this skill when the user writes `/ex-viz <topic>`, says “explain visually”, or asks to explain a topic in an extremely simple, picture-first way.

## Goal

Make the topic feel obvious to a complete beginner. Produce a self-contained HTML artifact with large visual scenes, very few words, and a short plain-language takeaway.

## Workflow

1. Identify the topic from `$ARGUMENTS`. If it is empty, ask what the user wants explained.
2. Confirm the core idea before teaching it. For time-sensitive, technical, niche, medical, legal, or financial topics, verify key facts with authoritative sources first.
3. Create a standalone HTML file in the workspace named `elin-<short-topic-name>.html`. Use lowercase kebab case for the filename.
4. Tell the story in as many steps needed. Each step must have:
   - one large, simple picture;
   - a short title of 2 to 5 words;
   - one sentence of 12 words or fewer.
5. Finish with a small summary of the things leart.
6. Open or render the artifact when possible and check that it is readable at a normal desktop width. Fix clipped content, tiny labels, low contrast, and confusing visuals before delivering it.

## Artifact design rules

- Make the pictures do most of the teaching. Prefer inline SVG or simple CSS drawings so the HTML remains standalone and works offline.
- Use familiar objects and concrete comparisons: pipes for data flow, toy boxes for storage, post offices for routing, recipe cards for programs, and so on.
- Use one visual metaphor consistently. Do not mix metaphors unless a transition is truly needed.
- Use a warm, playful design: a light background, large type, strong contrast, rounded cards, and generous spacing.
- Keep each visual sparse: one central object, clear arrows, and no decorative clutter.
- Avoid unexplained jargon, acronyms, formulas, prerequisites, and hedging. If a technical word is essential, define it in 5 words or fewer beside the picture.
- Do not talk down to the reader. “Noob” means new to the topic, not incapable.
- Do not use external scripts, fonts, images, or CDNs.

## Writing rules

- Start with what the thing is, using a concrete comparison.
- Use everyday words and active voice.
- Prefer “A password is like a secret key” over abstract definitions.
- Keep the total visible body copy under 120 words unless the user asks for more detail.
- Include only facts needed to answer the user’s topic. If important caveats are needed, add one small “Good to know” card in plain language.
- Include something interesting knowledge or fact about the topic, something that makes it memorable.

## Delivery

Reply with a one-line summary and a clickable link to the HTML file. Do not paste the full explanation into chat unless the user asks for it.
