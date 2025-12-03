#!/bin/bash
clear
cat utils/logo.txt 2>/dev/null || echo "RustDesk Server Self-Hosted v1.0.0 - @nmiuc 2025"
echo "Instalando Docker si falta..."
bash utils/check_docker.sh
echo "Detectando IP..."
source utils/detect_ip.sh
echo "Generando clave segura..."
KEY=$(bash utils/generate_secure_key.sh)
echo "Creando .env..."
cat > .env << EOF
PUBLIC_IP=$PUBLIC_IP
KEY=$KEY
EOF
echo "Levantando servidor..."
docker compose up -d
echo "¡LISTO! Conecta clientes con:"
echo "ID: $PUBLIC_IP:21116"
echo "Key: $KEY"
echo "Relay: $PUBLIC_IP:21117"
echo "Abre puertos 21115-21119/UDP en firewall."
