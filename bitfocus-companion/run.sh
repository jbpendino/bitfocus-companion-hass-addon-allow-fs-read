#!/usr/bin/with-contenv bashio
# ==============================================================================
# Start Bitfocus Companion service
# ==============================================================================

# Maak de configuratiemap aan
CONFIG_DIR="/data/companion"
bashio::log.info "Maken van configuratiemap $CONFIG_DIR"
mkdir -p "$CONFIG_DIR"

# Pas eigenaar aan zodat companion er toegang toe heeft
chown -R companion:companion "$CONFIG_DIR"
chmod -R 755 "$CONFIG_DIR"

bashio::log.info "Starten van Bitfocus Companion met configuratie in $CONFIG_DIR"

# Stel configuratiemap in en start de originele entrypoint
export COMPANION_CONFIG_BASEDIR="$CONFIG_DIR"
exec /docker-entrypoint.sh sh -c "./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir $COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev"
