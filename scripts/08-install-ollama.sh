#!/usr/bin/env bash
set -euo pipefail
echo "[08] Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh
echo "[08] Ensure ollama service is running..."
sudo systemctl daemon-reload || true
sleep 2
ollama --version || true
echo "[08] Ollama installed (verify with 'ollama --version')."
