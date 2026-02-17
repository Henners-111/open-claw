#!/usr/bin/env bash
set -euo pipefail
UNIT="/etc/systemd/system/openclaw-gateway.service"
BACKUP="${UNIT}.bak.$(date -u +%Y%m%dT%H%M%SZ)"
sudo cp "$UNIT" "$BACKUP" || true
sudo tee "$UNIT" > /dev/null <<'INNER'
[Unit]
Description=OpenClaw AI Gateway
After=network-online.target ollama.service
Wants=network-online.target
Requires=ollama.service
StartLimitBurst=5
StartLimitIntervalSec=600

[Service]
Type=simple
User=henry
WorkingDirectory=/opt/openclaw
EnvironmentFile=-/opt/openclaw/.env
ExecStart=/usr/bin/openclaw gateway start
ExecStop=/usr/bin/openclaw gateway stop
Restart=on-failure
RestartSec=10s

NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=full
ProtectHome=yes
ReadWritePaths=/opt/openclaw /var/log/openclaw

StandardOutput=journal
StandardError=journal
SyslogIdentifier=openclaw-gateway

[Install]
WantedBy=multi-user.target
INNER
sudo systemctl daemon-reload
sudo loginctl enable-linger henry || true
sudo systemctl restart openclaw-gateway.service || true
sudo systemctl status openclaw-gateway --no-pager || true
sudo journalctl -u openclaw-gateway -n 100 --no-pager || true
