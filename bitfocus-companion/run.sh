#!/usr/bin/env bashio

# Get config
DATA_PATH=$(bashio::config 'data_path')

# Ensure data directory exists
mkdir -p /share/$DATA_PATH

# Ensure the companion user can write to the data directory
chown -R companion:companion /share/$DATA_PATH
 
# Link the share directory to /companion
rm -rf /companion
ln -sf /share/$DATA_PATH /companion

# Start Companion
exec /docker-entrypoint.sh node /app/main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir /companion --extra-module-path /app/module-local-dev
