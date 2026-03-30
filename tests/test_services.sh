#!/bin/bash
echo "=== Test Web ==="
curl -s -o /dev/null -w "%{http_code}" http://localhost:81 | grep -q "200"
if [ $? -eq 0 ]; then echo "[OK] Web fonctionne"; else echo "[FAIL] Web KO"; exit 1; fi

echo "=== Test DNS container ==="
docker ps | grep -q dns
if [ $? -eq 0 ]; then echo "[OK] DNS container running"; else echo "[FAIL] DNS KO"; exit 1; fi

echo "=== Test DHCP container ==="
docker ps | grep -q dhcp
if [ $? -eq 0 ]; then echo "[OK] DHCP container running"; else echo "[FAIL] DHCP KO"; exit 1; fi

echo "=== Tous les tests sont passes ==="
