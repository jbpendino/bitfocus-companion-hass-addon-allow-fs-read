#!/bin/bash
set -e

# Maak de data directory aan in de addon_config map
CONFIG_DIR="/addon_config"
mkdir -p ${CONFIG_DIR}
chown -R companion:companion ${CONFIG_DIR}

# Maak een symlink van /companion naar de config directory als dat nodig is
if [ ! -L "/companion" ]; then
  # Als /companion al bestaat, verplaats de inhoud naar de config directory
  if [ -d "/companion" ] && [ "$(ls -A /companion)" ]; then
    cp -a /companion/. ${CONFIG_DIR}/
    rm -rf /companion
  else
    rm -rf /companion
  fi
  
  # Maak de symlink
  ln -sf ${CONFIG_DIR} /companion
fi

# Zorg ervoor dat de companion gebruiker eigenaar is
chown -R companion:companion /companion

# Start Companion via het standaard entrypoint met de juiste parameters
cd /app
exec /docker-entrypoint.sh ./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir $COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev
