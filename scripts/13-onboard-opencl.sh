#!/usr/bin/env bash
set -euo pipefail
echo "[13] Starting OpenClaw onboarding (TUI)..."
echo "Follow prompts: select Telegram, Ollama, model gpt-oss:20b-cloud, enable hooks."
openclaw onboard --install-daemon || openclaw onboard || true
echo "[13] Onboarding finished (follow output)."
