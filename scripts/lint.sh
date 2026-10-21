#!/usr/bin/env bash
# Lint shell scripts in this repository (used locally and in CI).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

mapfile -t SCRIPTS < <(find . -name '*.sh' -not -path './.git/*' | sort)

if [[ ${#SCRIPTS[@]} -eq 0 ]]; then
  echo "No shell scripts found."
  exit 0
fi

echo "==> shellcheck"
if ! command -v shellcheck >/dev/null 2>&1; then
  echo "shellcheck not installed; skipping (CI installs it)." >&2
else
  shellcheck -x "${SCRIPTS[@]}"
fi

echo "==> bash -n (syntax)"
for f in "${SCRIPTS[@]}"; do
  bash -n "$f"
  echo "  OK $f"
done

echo "All lint checks passed."
