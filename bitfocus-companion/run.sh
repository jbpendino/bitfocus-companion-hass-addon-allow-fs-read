#!/bin/bash

# Definieer een vaste config directory
CONFIG_DIR="/companion"

# Zorg ervoor dat de config directory bestaat
mkdir -p ${CONFIG_DIR}
chown companion:companion ${CONFIG_DIR}

# Start Companion met de nodige parameters
exec /docker-entrypoint.sh ./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir ${CONFIG_DIR} --extra-module-path /app/module-local-dev
