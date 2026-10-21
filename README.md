# OpenClaw Starter Kit

**One command to a hardened, self-hosted [OpenClaw](https://github.com/openclaw/openclaw) agent — tuned for Raspberry Pi and Ollama, with copy-paste example skills.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![CI](https://github.com/kyl3kan3/openclaw-starter-kit/actions/workflows/ci.yml/badge.svg)](https://github.com/kyl3kan3/openclaw-starter-kit/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/kyl3kan3/openclaw-starter-kit?label=release)](https://github.com/kyl3kan3/openclaw-starter-kit/releases)

<!-- Demo: replace with install GIF or asciinema once recorded -->
<!-- [![asciicast](https://asciinema.org/a/PLACEHOLDER.svg)](https://asciinema.org/a/PLACEHOLDER) -->

---

## Why use this?

OpenClaw gives you an autonomous agent on your own hardware. Going from `git clone` to something **safe and useful** means choosing models, locking down the gateway, and writing skills. This kit ships:

- **Loopback-first security defaults** — gateway on `127.0.0.1`, secrets in `.env`, checklist in [SECURITY.md](./SECURITY.md)
- **Ollama-first model routing** — run cheap/local turns for free; optional cloud escalation
- **Curated example skills** — expense tracking, API usage, meetings, knowledge base ([`skills/`](./skills))
- **Docker option** — [`docker-compose.yml`](./docker-compose.yml) for container hosts

Good for homelabs, Raspberry Pi builders, and anyone who wants an always-on agent without per-token cloud bills.

## Quick start

```bash
git clone https://github.com/kyl3kan3/openclaw-starter-kit.git
cd openclaw-starter-kit
cp .env.example .env    # edit model + optional API keys
./install.sh
```

Validate without installing:

```bash
cp .env.example .env
./install.sh --dry-run --skip-onboard
```

## Requirements

| Component | Notes |
|-----------|--------|
| **Node.js 22+** | Required for OpenClaw (`node -v`) |
| **npm** | Used to install the `openclaw` CLI globally |
| **Ollama** (recommended) | Local models; [install guide](https://ollama.com/download) |
| **Raspberry Pi** | Tested mindset: Pi 5 (8GB), small models (`llama3.2:3b`), watch thermals |
| **Linux / macOS** | Primary targets for `install.sh` |
| **Docker** (optional) | Use `docker compose up` instead of `install.sh` |

Windows: use WSL2 or Docker; native `install.sh` is not supported.

## Configuration

All settings live in `.env` (from [`.env.example`](./.env.example)):

| Variable | Purpose |
|----------|---------|
| `OPENCLAW_LOCAL_MODEL` | Default Ollama model (e.g. `ollama/llama3.2:3b`) |
| `OLLAMA_HOST` | Ollama API URL |
| `OPENCLAW_BIND` / `OPENCLAW_PORT` | Gateway bind address (keep `127.0.0.1`) |
| `ANTHROPIC_API_KEY` / `OPENAI_API_KEY` | Optional hosted models |
| `TELEGRAM_BOT_TOKEN` / `DISCORD_BOT_TOKEN` | Optional messaging channels |

After install, copy skills from [`skills/`](./skills) into your OpenClaw workspace.

## Skills included

| Skill | Summary |
|-------|---------|
| [expense-tracker](./skills/expense-tracker) | Receipt photo → spreadsheet row |
| [usage-tracker](./skills/usage-tracker) | API spend and budget alerts |
| [meeting-processor](./skills/meeting-processor) | Action items from transcripts |
| [knowledge-base](./skills/knowledge-base) | Personal RAG over your sources |

Attribution and import notes: [skills/ATTRIBUTION.md](./skills/ATTRIBUTION.md).

## Security

Read [SECURITY.md](./SECURITY.md) before exposing the gateway beyond localhost. Use Tailscale or WireGuard instead of opening router ports.

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `No .env found` | `cp .env.example .env` |
| `Node … requires Node 22` | Upgrade Node via [nodejs.org](https://nodejs.org) or nvm |
| `OPENCLAW_BIND=0.0.0.0 is not allowed` | Set `OPENCLAW_BIND=127.0.0.1` in `.env` |
| Ollama model pull fails | Run `ollama pull llama3.2:3b` manually; check disk/RAM |
| Onboarding exits early | Re-run `openclaw onboard` after fixing errors |
| Pi feels slow / throttles | Use a smaller model; improve cooling; avoid huge context |

Installer flags: `./install.sh --help`

## FAQ

**Is this a fork of OpenClaw?**  
No. It installs the upstream `openclaw` npm package and adds opinionated defaults plus example skills.

**Can I run 100% offline?**  
Yes, with Ollama only — leave hosted API keys blank in `.env`.

**Does this work on a VPS?**  
Yes on Linux VPS with Node 22+. Still bind to loopback and use a VPN/tunnel for remote access.

**How do I add my own skill?**  
Add a folder under `skills/` with a `SKILL.md` (see existing examples), then copy it into your agent workspace.

**Where do I report bugs?**  
[GitHub Issues](https://github.com/kyl3kan3/openclaw-starter-kit/issues) — see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Development

```bash
./scripts/lint.sh              # shellcheck + bash -n
./install.sh --dry-run         # CI-style installer check
```

## Contributing

Issues and PRs welcome — especially new **generic** example skills, platform notes, and hardening improvements. See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

[MIT](./LICENSE) — no warranty.

Built on [OpenClaw](https://github.com/openclaw/openclaw).
