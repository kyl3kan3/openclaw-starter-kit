---
name: meeting-processor
description: Extract action items, owners, and deadlines from meeting transcripts. Use when the user shares a transcript or asks to process meeting notes.
---

# Meeting Processor

Turns meeting transcripts into structured action items with optional task-manager integration.

## When to use

- User pastes or attaches a meeting transcript
- "Extract action items from this meeting"
- "What am I waiting on from others?"

## Setup

1. Configure transcript sources and task manager in `example-config.yaml`.
2. Keep `auto_create: false` until you trust the extraction quality.
3. Route approval prompts to your messaging channel.

## Agent workflow

1. Parse the transcript for tasks, owners, deadlines, and priority.
2. Separate **my tasks** vs **waiting on others**.
3. Present an approval queue before creating tasks in Todoist/Asana.
4. Only create tasks the user explicitly approves.

## Guardrails

- Never invent deadlines or owners; mark unknown fields as `TBD`.
- Do not send messages to third parties without user approval.

## Prompt templates

See [prompts.md](./prompts.md).
