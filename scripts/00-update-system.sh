#!/usr/bin/env bash
set -euo pipefail
echo "[00] apt update & upgrade"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl wget git vim htop net-tools ufw fail2ban unattended-upgrades python3 python3-venv python3-pip build-essential jq ca-certificates openssl gnupg lsb-release
echo "[00] done"
