#!/usr/bin/env bash
set -e

# Zorg dat de configuratiemap bestaat
mkdir -p /companion
chmod 777 /companion

# Ga naar de applicatiemap
cd /app

# Start de applicatie
exec ./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir /companion --extra-module-path /app/module-local-dev
