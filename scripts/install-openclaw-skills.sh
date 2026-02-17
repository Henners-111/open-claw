#!/usr/bin/env bash
set -euo pipefail
REPORT="/opt/openclaw/skill-install-report.txt"
mkdir -p /opt/openclaw
: > "$REPORT"
SKILLS=(summarize blogwatcher github)
echo "Installing skills: ${SKILLS[*]}" | tee -a "$REPORT"
for s in "${SKILLS[@]}"; do
  echo "Installing $s..." | tee -a "$REPORT"
  if openclaw skills install "$s"; then
    echo "OK $s" | tee -a "$REPORT"
  else
    echo "Retrying $s with sudo..." | tee -a "$REPORT"
    sudo env "PATH=$PATH" openclaw skills install "$s" && echo "OK $s" | tee -a "$REPORT" || echo "FAIL $s" | tee -a "$REPORT"
  fi
done
echo "Report:"; cat "$REPORT"
