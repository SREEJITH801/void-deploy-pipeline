#!/usr/bin/env bash
set -euo pipefail

echo "[+] Runner info"
hostname
whoami
id

echo "[+] Environment"
env

echo "[+] Searching for flags"
find / -iname "*flag*" 2>/dev/null

echo "[+] Reading CI flag"
if [ -f /opt/void/ci_flag.txt ]; then
    cat /opt/void/ci_flag.txt
else
    echo "Flag file not found"
fi
