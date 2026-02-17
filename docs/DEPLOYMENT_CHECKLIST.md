# DEPLOYMENT_CHECKLIST.md
Follow scripts in order:
1. scripts/00-update-system.sh
2. scripts/01-setup-firewall.sh
3. scripts/02-setup-fail2ban.sh
4. scripts/03-setup-auto-updates.sh
5. scripts/07-install-nodejs.sh
6. scripts/08-install-ollama.sh
7. scripts/09-configure-ollama-localhost.sh
8. scripts/10-pull-model.sh
9. scripts/11-setup-openclaw-dirs.sh
10. scripts/12-install-openclaw.sh
11. scripts/13-onboard-openclaw.sh (interactive)
12. scripts/install-openclaw-skills.sh
13. scripts/fix-openclaw-unit-and-restart.sh
14. Configure cloudflared and systemd units
15. scripts/audit-openclaw.sh
