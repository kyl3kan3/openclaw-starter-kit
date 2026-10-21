---
name: knowledge-base
description: Ingest URLs, videos, PDFs, and notes into a personal RAG knowledge base and answer questions from stored sources. Use when the user wants to save research or query prior reading.
---

# Knowledge Base (RAG)

Personal research memory: ingest content, embed for search, answer with citations.

## When to use

- "Save this article to my knowledge base"
- "What do I already know about X?"
- "Research X using my notes plus the web"

## Setup

1. Choose storage in `example-config.yaml` (SQLite + sqlite-vec is the default).
2. Enable only the source types you need (URL, YouTube, PDF, etc.).
3. Grant the agent read access to ingestion tools and the database path.

## Agent workflow

1. **Ingest:** extract title, date, entities, and key points; store embeddings.
2. **Query:** retrieve top matches by semantic similarity and recency.
3. **Answer:** cite source titles/URLs; say when the knowledge base has no match.

## Guardrails

- Respect copyright and paywalls; do not bypass authentication.
- Do not ingest secrets or credentials from pasted content.

## Prompt templates

See [prompts.md](./prompts.md).
