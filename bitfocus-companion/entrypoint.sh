#!/bin/bash

# Zorg ervoor dat de config directory bestaat
mkdir -p /companion
chmod 777 /companion

# Start Companion direct
exec ./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir /companion --extra-module-path /app/module-local-dev
