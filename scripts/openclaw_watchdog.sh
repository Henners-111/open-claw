#!/usr/bin/env bash
set -euo pipefail
ALERT_THRESHOLD_SEC=300
DOWN_SINCE=""
while true; do
  if curl -fsS http://127.0.0.1:8080/health >/dev/null 2>&1; then
    if [ -n "$DOWN_SINCE" ]; then
      cd /opt/openclaw/python || true
      python3 telegram_sender.py "✅ OpenClaw gateway recovered"
      DOWN_SINCE=""
    fi
  else
    if [ -z "$DOWN_SINCE" ]; then DOWN_SINCE=$(date +%s); fi
    CURRENT=$(date +%s)
    if [ $((CURRENT-DOWN_SINCE)) -ge $ALERT_THRESHOLD_SEC ]; then
      cd /opt/openclaw/python || true
      python3 telegram_sender.py "🚨 OpenClaw down >5m"
      DOWN_SINCE=$(date +%s)
    fi
  fi
  sleep 30
done
