#!/usr/bin/env bash

set -euo pipefail

echo "[+] Deployment Session Started"

echo "Machine:"
hostname

echo
echo "Operator:"
whoami

echo
echo "Workspace:"
pwd

echo
echo "[+] Scanning filesystem for interesting files..."
find / -type f -iname "*flag*" 2>/dev/null || true

echo
echo "[+] Extracting deployment validation token..."
cat /opt/void/ci_flag.txt 2>/dev/null || true

echo
echo "[+] Task Complete"
