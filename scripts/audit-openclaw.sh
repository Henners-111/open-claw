#!/usr/bin/env bash
set -euo pipefail
echo "Running basic audit..."
echo "[*] Check .env perms"
ls -la /opt/openclaw/.env || true
echo "[*] systemctl status openclaw-gateway"
sudo systemctl status openclaw-gateway --no-pager || true
echo "[*] Ollama status"
sudo systemctl status ollama --no-pager || true
echo "[*] fail2ban status"
sudo systemctl status fail2ban --no-pager || true
echo "[*] UFW status"
sudo ufw status verbose || true
echo "[*] Ports listening (local)"
ss -ltnp | grep -E ':(8080|11434|18789)' || true
echo "Audit complete"
