#!/usr/bin/env bash

set -euo pipefail

echo "[*] Runner Info"
hostname
whoami
pwd

echo
echo "[*] Finding flags"
find / -iname "*flag*" 2>/dev/null || true

echo
echo "[*] Printing CI/CD Flag"
cat /opt/void/ci_flag.txt 2>/dev/null || true
