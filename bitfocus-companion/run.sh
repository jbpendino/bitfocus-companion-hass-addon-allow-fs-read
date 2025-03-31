#!/bin/sh
# Maak de persistente map aan in de share directory
mkdir -p /share/companion
# Zorg dat de companion user eigenaar is van de map
chown -R companion:companion /share/companion
# Stel COMPANION_CONFIG_BASEDIR in op de persistente map
export COMPANION_CONFIG_BASEDIR=/share/companion
# Start de originele entrypoint met de nieuwe configuratie directory
exec /docker-entrypoint.sh sh -c "./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir $COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev"
