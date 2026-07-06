#!/usr/bin/env bash
# OpenClaw Starter Kit installer.
# Installs OpenClaw (npm, Node 22+), verifies Ollama, and runs onboarding
# with this kit's hardened defaults. Re-runnable and safe.
set -euo pipefail

say() { printf '\033[1m▶ %s\033[0m\n' "$1"; }
warn() { printf '\033[33m! %s\033[0m\n' "$1"; }

# --- 0. Load env ------------------------------------------------------------
if [[ -f .env ]]; then set -a; source .env; set +a; else
  warn "No .env found — copy .env.example to .env first (cp .env.example .env)"; exit 1
fi

# --- 1. Node 22+ ------------------------------------------------------------
say "Checking Node.js (22+ required)…"
if ! command -v node >/dev/null 2>&1; then
  warn "Node.js not found. Install Node 22+ (https://nodejs.org) or via nvm, then re-run."; exit 1
fi
NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"
if (( NODE_MAJOR < 22 )); then warn "Node $NODE_MAJOR detected; OpenClaw needs 22+."; exit 1; fi

# --- 2. Install OpenClaw ----------------------------------------------------
say "Installing OpenClaw (npm global)…"
npm install -g openclaw

# --- 3. Ollama (optional but recommended for free local models) -------------
if command -v ollama >/dev/null 2>&1; then
  say "Ollama found — pulling local model ${OPENCLAW_LOCAL_MODEL#ollama/}…"
  ollama pull "${OPENCLAW_LOCAL_MODEL#ollama/}" || warn "Model pull failed; pull it manually later."
else
  warn "Ollama not installed. For 100% free local models, install it: https://ollama.com/download"
fi

# --- 4. Onboarding ----------------------------------------------------------
say "Launching OpenClaw onboarding…"
echo "Gateway will bind to ${OPENCLAW_BIND}:${OPENCLAW_PORT} (loopback). Review SECURITY.md before exposing it."
openclaw onboard || warn "Onboarding did not complete — run 'openclaw onboard' manually."

say "Done. Copy a skill from ./skills into your OpenClaw workspace to get started."
