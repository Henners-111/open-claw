#!/usr/bin/env bash
set -euo pipefail
echo "[11] Creating OpenClaw directory structure..."
sudo mkdir -p /opt/openclaw/workspace /opt/openclaw/logs /opt/openclaw/scripts /opt/openclaw/config /var/log/openclaw /opt/openclaw/hooks
sudo chown -R $USER:$USER /opt/openclaw /var/log/openclaw
touch /opt/openclaw/.env
chmod 600 /opt/openclaw/.env
echo "[11] Created structure under /opt/openclaw."
