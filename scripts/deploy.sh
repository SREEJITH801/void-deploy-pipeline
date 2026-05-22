echo "========== SYSTEM ENUMERATION =========="

printf "\n[+] Checking sudo permissions\n"
sudo -l 2>/dev/null || true

printf "\n[+] Searching for SUID binaries\n"
find / -type f -perm -u=s 2>/dev/null || true

printf "\n[+] Attempting root directory listing\n"
sudo ls -lah /root 2>/dev/null || true

printf "\n[+] Looking for possible root flags\n"
sudo find /root -iname "*flag*" 2>/dev/null || true
sudo find / -iname "root.txt" 2>/dev/null || true

printf "\n[+] Dumping interesting VOID files\n"
sudo find /opt -type f 2>/dev/null | grep -i void || true

printf "\n[+] Current identity\n"
id

printf "\n========== ENUMERATION COMPLETE ==========\n"
