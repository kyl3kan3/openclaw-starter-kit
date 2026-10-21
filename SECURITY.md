# Security checklist

An OpenClaw agent can run commands, read files, and message people on your behalf. Treat it like a user account with real power. Work through this before exposing it to anything beyond localhost.

## Before you expose it
- [ ] **Bind to loopback.** Keep `OPENCLAW_BIND=127.0.0.1`. Never bind `0.0.0.0` on a public network.
- [ ] **Use a tunnel, not a port-forward.** Reach it remotely via Tailscale / WireGuard, not an open router port.
- [ ] **Secrets live in `.env`.** Never commit `.env`; it's gitignored here. Rotate any key that touches a repo.
- [ ] **Least-privilege messaging tokens.** Scope Telegram/Discord bots to only the chats they need.

## Agent authority
- [ ] **Review exec/tool permissions.** Decide what the agent may run before turning it loose; start restrictive.
- [ ] **No unattended destructive actions.** Require confirmation for anything hard to reverse or outward-facing.
- [ ] **Separate the OS user.** Run OpenClaw as a dedicated non-sudo user, not your primary account.

## Keep it patched
- [ ] **Update regularly** (`npm update -g openclaw` or pull the latest image).
- [ ] **Track advisories** for OpenClaw and dependencies (`npm update -g openclaw`).

## Reporting vulnerabilities

Please **do not** open public issues for security problems. Open a [GitHub Security Advisory](https://github.com/kyl3kan3/openclaw-starter-kit/security/advisories/new) or contact the maintainer privately. Include steps to reproduce and impact; do not include live secrets.
