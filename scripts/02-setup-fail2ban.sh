#!/usr/bin/env bash
set -euo pipefail
echo "[02] Writing minimal fail2ban jail.local..."
sudo tee /etc/fail2ban/jail.local > /dev/null <<'INNER'
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 5
destemail = root@localhost
sendername = Fail2Ban

[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s
INNER
echo "[02] Enabling and starting fail2ban..."
sudo systemctl daemon-reload
sudo systemctl enable --now fail2ban
SOCKET_PATH="/run/fail2ban/fail2ban.sock"
echo "[02] Waiting for fail2ban socket..."
for i in {1..10}; do
  if [ -S "${SOCKET_PATH}" ]; then
    echo "[02] fail2ban socket detected."
    break
  fi
  sleep 1
done
echo "[02] fail2ban status:"
sudo systemctl status fail2ban --no-pager
sudo fail2ban-client status || true
