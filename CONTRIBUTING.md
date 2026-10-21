# Contributing

Thanks for helping improve the OpenClaw Starter Kit.

## Ways to contribute

- **Bug reports** — reproducible steps, OS, Node version, and sanitized `.env` (no secrets)
- **Example skills** — generic, reusable `SKILL.md` folders under `skills/` (no API keys, customer data, or business-specific workflows)
- **Docs** — README, SECURITY.md, platform install notes (Pi, Linux, macOS, Docker)
- **Installer / CI** — idempotent `install.sh`, tests, shellcheck clean

## Pull request checklist

- [ ] `./scripts/lint.sh` passes
- [ ] `./install.sh --dry-run --skip-onboard` passes
- [ ] No secrets or personal data in commits
- [ ] Skills include attribution if adapted from another repo

## Code style

- Shell: `bash` with `set -euo pipefail`, comments for non-obvious behavior, `shellcheck` clean
- Skills: YAML frontmatter on `SKILL.md` with `name` and `description`

## Security

See [SECURITY.md](./SECURITY.md). Do not open PRs that weaken default bind settings or commit credentials.
