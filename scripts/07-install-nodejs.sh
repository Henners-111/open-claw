#!/usr/bin/env bash
set -euo pipefail
echo "[07] Installing Node.js 20.x..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
node --version
npm --version
echo "[07] Node installed."
