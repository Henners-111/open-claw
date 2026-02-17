#!/usr/bin/env bash
set -euo pipefail
echo "[12] Installing OpenClaw via npm..."
if command -v openclaw >/dev/null 2>&1; then
  echo "[12] openclaw already installed: $(openclaw --version)"
else
  # Prefer to install as current user if nvm present; otherwise use sudo
  if command -v nvm >/dev/null 2>&1 2>/dev/null; then
    npm install -g openclaw@latest
  else
    sudo npm install -g openclaw@latest || npm install -g openclaw@latest
  fi
fi
openclaw --version || true
echo "[12] OpenClaw installation attempted."
