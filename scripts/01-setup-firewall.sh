#!/usr/bin/env bash
set -euo pipefail
echo "[01] Configuring UFW firewall..."
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp comment 'SSH'
sudo ufw allow in on lo
sudo ufw allow out on lo
sudo ufw --force enable
sudo ufw status verbose
echo "[01] UFW configured."
