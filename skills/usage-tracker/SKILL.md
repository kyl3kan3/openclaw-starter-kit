---
name: usage-tracker
description: Monitor AI API spend across providers, compare to budgets, and alert on spikes. Use when the user asks about API costs, usage, billing, or budget limits.
---

# Usage Tracker

Tracks spend across configured AI providers and reports against daily/weekly limits.

## When to use

- "How much did I spend on APIs today?"
- "Weekly usage report"
- "Am I close to my budget?"

## Setup

1. Set provider API keys in `.env` (see `.env.example`).
2. Copy `example-config.yaml` into your OpenClaw config directory and adjust limits.
3. Enable notifications on your messaging channel if you want alerts.

## Agent workflow

1. Read usage from each enabled provider (OpenAI, Anthropic, etc.) using available tools or dashboards.
2. Sum totals and compare to `daily_limit_usd` / `weekly_limit_usd` from config.
3. Flag unusual spikes (>20% above trailing average if history exists).
4. Reply with a brief summary; never log or echo full API keys.

## Output format

```
💰 DAILY USAGE
OpenAI: $X.XX
Anthropic: $X.XX
Total: $X.XX / $50 (XX%)
```

## Guardrails

- Read-only on provider accounts; no purchases or plan changes without explicit user approval.
- Redact key material in all outputs.

## Prompt templates

See [prompts.md](./prompts.md) for copy-paste prompt patterns.
