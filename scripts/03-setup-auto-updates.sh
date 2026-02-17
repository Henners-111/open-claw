#!/usr/bin/env bash
set -euo pipefail
echo "[03] Enabling unattended-upgrades..."
sudo dpkg-reconfigure -plow unattended-upgrades || true
sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades > /dev/null <<'INNER'
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "03:00";
INNER
echo "[03] Unattended upgrades configured."
