# OpenClaw Starter Kit 🦞

> One command to a running, self-hosted [OpenClaw](https://github.com/openclaw/openclaw) agent — Raspberry Pi + Ollama friendly, with hardened defaults and curated example skills.

The fastest path from `git clone` to a working autonomous agent. Sensible security defaults, a local-model config so you can run it for free, and a few real skills to copy.

[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](./LICENSE)

---

## What this is / who it's for

OpenClaw is a self-hosted AI agent that lives on your own hardware. Getting from a fresh install to a *safe, useful* agent means wiring up a model, locking down the gateway, and writing your first skills. This kit gives you opinionated, working defaults for all three so you can skip the yak-shaving.

Good for: self-hosters, homelab tinkerers, and builders who want an always-on agent without a per-token cloud bill.

New to OpenClaw entirely? Start with the zero-to-agent walkthrough:
**→ [OpenClaw for Beginners: Zero to Autonomous Agent in One Afternoon](https://marketmai.com/blog/openclaw-beginner-guide-2026/)**

## Quickstart

```bash
git clone https://github.com/kyl3kan3/openclaw-starter-kit.git
cd openclaw-starter-kit
cp .env.example .env      # fill in your keys / model choice
./install.sh              # installs OpenClaw (Node 22+) and runs onboarding
```

Prefer containers? See [`docker-compose.yml`](./docker-compose.yml) for a minimal OpenClaw + Ollama stack.

Full step-by-step with screenshots:
**→ [The Definitive OpenClaw Installation Guide](https://marketmai.com/blog/openclaw-setup-guide-launch/)**

## Run it 100% free with local models

`.env.example` ships with an Ollama-first config: a small local model handles routing and cheap turns, and you only escalate to a hosted model when a task actually needs it. That hybrid setup is how you get an always-on agent for ~$0/mo.

**→ [OpenClaw + Ollama: Run Your Agent 100% Free (model picks + routing config)](https://marketmai.com/blog/openclaw-ollama-free-local-models/)**

## Run it on a Raspberry Pi

The defaults here are tuned to run headless on a Pi 5 (8GB). Watch for thermal throttling under sustained load and keep the model small.

**→ [OpenClaw on a Raspberry Pi: Complete Guide](https://marketmai.com/blog/openclaw-raspberry-pi-complete-guide/)**

## Included example skills

The [`skills/`](./skills) folder has working examples you can copy and adapt:

- **expense-tracker** — forward a receipt photo to Telegram; the agent parses it and logs to a sheet. [Deep-dive →](https://marketmai.com/blog/expense-tracking-openclaw-telegram-guide/)

More on how skills work:
**→ [OpenClaw Skills: How to Build Custom Skills That Automate Anything](https://marketmai.com/blog/openclaw-custom-skills-productivity/)**

## Hardening / security defaults

This kit binds the gateway to loopback, keeps secrets in `.env`, and ships a [`SECURITY.md`](./SECURITY.md) checklist. **Read it before exposing anything to a network.**

**→ [OpenClaw Security Hardening Guide](https://marketmai.com/blog/openclaw-cve-33579-patch-hardening-guide/)**

## Make it earn

Once you've got a reliable agent, the same infrastructure can run a solo business — setup-as-a-service, white-label assistants, monitoring subscriptions.

**→ [The One-Person Company Playbook: Running a Solo Business with OpenClaw Agents](https://marketmai.com/blog/one-person-company-openclaw-agents/)**

## Contributing

Issues and PRs welcome — new example skills, platform install notes, and hardening improvements especially. Keep additions real and tested.

## License

[MIT](./LICENSE) — do whatever, no warranty.

---

Guides & operator playbooks: **[MarketMai](https://marketmai.com)** · Built on [OpenClaw](https://github.com/openclaw/openclaw).
