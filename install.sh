#!/usr/bin/env bash
# OpenClaw Starter Kit installer.
# Installs OpenClaw (npm, Node 22+), verifies Ollama, and runs onboarding
# with this kit's hardened defaults. Safe to re-run (idempotent).
set -euo pipefail

DRY_RUN=0
SKIP_ONBOARD=0
SKIP_OPENCLAW_INSTALL=0

usage() {
  cat <<'EOF'
Usage: ./install.sh [OPTIONS]

Options:
  --dry-run              Validate environment and print planned steps; do not install.
  --skip-onboard         Install OpenClaw but skip interactive onboarding.
  --skip-openclaw-install  Skip npm global install (use when OpenClaw is already installed).
  -h, --help             Show this help.

Environment:
  Copy .env.example to .env before running (or use --dry-run with defaults).
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --skip-onboard) SKIP_ONBOARD=1 ;;
    --skip-openclaw-install) SKIP_OPENCLAW_INSTALL=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

say() { printf '\033[1m▶ %s\033[0m\n' "$1"; }
warn() { printf '\033[33m! %s\033[0m\n' "$1"; }
die() { printf '\033[31m✗ %s\033[0m\n' "$1" >&2; exit 1; }

run() {
  if (( DRY_RUN )); then
    printf '[dry-run] %s\n' "$*"
  else
    "$@"
  fi
}

# --- 0. Load env ------------------------------------------------------------
KIT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$KIT_ROOT"

if [[ -f .env ]]; then
  set -a
  # shellcheck source=/dev/null
  source .env
  set +a
elif (( DRY_RUN )); then
  warn "No .env found — using defaults from .env.example for dry-run only."
  set -a
  # shellcheck source=/dev/null
  source .env.example
  set +a
else
  die "No .env found. Run: cp .env.example .env  (then edit values and re-run)"
fi

: "${OPENCLAW_LOCAL_MODEL:=ollama/llama3.2:3b}"
: "${OPENCLAW_BIND:=127.0.0.1}"
: "${OPENCLAW_PORT:=8787}"

if [[ "$OPENCLAW_BIND" == "0.0.0.0" ]]; then
  die "OPENCLAW_BIND=0.0.0.0 is not allowed by this kit. Use 127.0.0.1 and a tunnel (Tailscale/WireGuard). See SECURITY.md."
fi

# --- 1. Node 22+ ------------------------------------------------------------
say "Checking Node.js (22+ required)…"
if ! command -v node >/dev/null 2>&1; then
  die "Node.js not found. Install Node 22+ (https://nodejs.org) or nvm, then re-run."
fi
NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"
if (( NODE_MAJOR < 22 )); then
  die "Node $(node -v) detected; OpenClaw requires Node 22 or newer."
fi

# --- 2. Install OpenClaw ----------------------------------------------------
if (( SKIP_OPENCLAW_INSTALL )); then
  say "Skipping OpenClaw npm install (--skip-openclaw-install)."
elif command -v openclaw >/dev/null 2>&1; then
  say "OpenClaw already installed ($(openclaw --version 2>/dev/null || echo 'version unknown')) — refreshing global package…"
  run npm install -g openclaw
else
  say "Installing OpenClaw (npm global)…"
  run npm install -g openclaw
fi

# --- 3. Ollama (optional but recommended for free local models) -------------
LOCAL_TAG="${OPENCLAW_LOCAL_MODEL#ollama/}"
if command -v ollama >/dev/null 2>&1; then
  say "Ollama found — ensuring local model ${LOCAL_TAG}…"
  if (( DRY_RUN )); then
    printf '[dry-run] ollama pull %s\n' "$LOCAL_TAG"
  else
    ollama pull "$LOCAL_TAG" || warn "Model pull failed; run: ollama pull ${LOCAL_TAG}"
  fi
else
  warn "Ollama not installed. For 100% local models, install: https://ollama.com/download"
fi

# --- 4. Onboarding ----------------------------------------------------------
if (( SKIP_ONBOARD )); then
  say "Skipping onboarding (--skip-onboard)."
elif (( DRY_RUN )); then
  say "Would run: openclaw onboard (gateway ${OPENCLAW_BIND}:${OPENCLAW_PORT})"
else
  say "Launching OpenClaw onboarding…"
  echo "Gateway binds to ${OPENCLAW_BIND}:${OPENCLAW_PORT} (loopback). Review SECURITY.md before exposing it."
  if ! openclaw onboard; then
    warn "Onboarding did not complete — run 'openclaw onboard' manually when ready."
  fi
fi

say "Done. Copy a skill from ./skills into your OpenClaw workspace to get started."
(( DRY_RUN )) && warn "Dry-run only — no packages were installed or onboarding started."
