#!/usr/bin/env bash
set -euo pipefail
echo "[09] Configure Ollama to bind to localhost only..."
sudo mkdir -p /etc/systemd/system/ollama.service.d
sudo tee /etc/systemd/system/ollama.service.d/override.conf > /dev/null <<'INNER'
[Service]
Environment="OLLAMA_HOST=127.0.0.1:11434"
INNER
sudo systemctl daemon-reload
sudo systemctl restart ollama || true
sleep 2
echo "Ollama status:"
sudo systemctl status ollama --no-pager || true
ss -ltn | grep 11434 || true
echo "[09] Ollama configured to localhost."
