#!/bin/bash
clear
cat utils/logo.txt 2>/dev/null || echo "RustDesk Server v1.0.0"
bash utils/check_docker.sh
source utils/detect_ip.sh
KEY=$(bash utils/generate_secure_key.sh)
docker compose up -d
echo "¡Listo! → ID: \$PUBLIC_IP:21116 | Key: \$KEY | Relay: \$PUBLIC_IP:21117"
