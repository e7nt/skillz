---
name: ex-text
description: Explain a topic like I am a noob in short, plain text. Use when the user types /ex-text <topic>, says “explain in text”, or asks for a text-only beginner explanation.
---

# Explain in Text

Use this skill when the user writes `/ex-text <topic>`, says “explain in text”, or asks for a text-only explanation for someone new to the topic.

## Goal

Explain the topic so a complete beginner can understand the main idea without a diagram, technical background, or jargon.

## Method

1. Identify the topic from `$ARGUMENTS`. If it is empty, ask what the user wants explained.
2. Confirm the core idea before teaching it. For time-sensitive, technical, niche, medical, legal, or financial topics, verify key facts with authoritative sources first.
3. Give the answer directly in chat. Do not create an artifact unless the user asks for one.
4. Explain in this order:
   - what it is, using one familiar comparison;
   - how it works, in 3 to 5 short steps;
   - why it matters, in one short sentence.
5. End with a one-sentence takeaway starting with “In short:”.

## Writing rules

- Assume the reader knows nothing about the topic, but never talk down to them.
- Use everyday words, active voice, and concrete examples.
- Define a necessary technical word in 5 words or fewer at first use.
- Keep the explanation under 250 words unless the user asks for more depth.
- Avoid acronyms, unexplained jargon, formulas, and unnecessary caveats.
- Add a brief “Good to know” note only when an important caveat would otherwise mislead the user.
- Include some interesting knowledge or fact about the topic, something that makes it memorable.
