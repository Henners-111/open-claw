# Henners-111 / open-claw

This repository contains scripts, systemd units and helper code to install and configure
OpenClaw on Ubuntu 24.04.2 LTS (Proxmox VM) using Ollama Cloud model `gpt-oss:20b-cloud`.

IMPORTANT:
- Do NOT commit secrets to this repo.
- After deployment, create /opt/openclaw/.env from .env.template and set permissions to 600.
- Replace the service "User=" in systemd files with your VM username if it's not `henry`.

Follow the numbered scripts in scripts/ in order. See docs/DEPLOYMENT_CHECKLIST.md for the full sequence.
