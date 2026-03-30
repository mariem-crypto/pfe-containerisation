#!/bin/bash
echo "=== Test Web ==="
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8081)
if [ "$HTTP_CODE" = "200" ]; then
    echo "[OK] Web fonctionne"
else
    echo "[FAIL] Web KO (code: $HTTP_CODE)"
    exit 1
fi

echo "=== Test DNS container ==="
if docker ps | grep -q dns; then
    echo "[OK] DNS container running"
else
    echo "[FAIL] DNS KO"
    exit 1
fi

echo "=== Test Nginx ==="
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8090)
if [ "$HTTP_CODE" = "200" ]; then
    echo "[OK] Nginx fonctionne"
else
    echo "[FAIL] Nginx KO (code: $HTTP_CODE)"
    exit 1
fi

echo "=== Test DHCP container ==="
if docker ps | grep -q dhcp; then
    echo "[OK] DHCP container running"
else
    echo "[FAIL] DHCP KO"
    exit 1
fi

echo "=== Tous les tests sont passes ==="
