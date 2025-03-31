#!/usr/bin/env bash
set -e

# Zorg ervoor dat de companion map bestaat en de juiste rechten heeft
mkdir -p /share/companion
chown -R companion:companion /share/companion

# Symboolkoppeling maken naar /companion als dit nog niet bestaat
if [ ! -L "/companion" ]; then
  # Als /companion een directory is, verplaats dan de inhoud
  if [ -d "/companion" ] && [ "$(ls -A /companion)" ]; then
    cp -r /companion/* /share/companion/ || true
    rm -rf /companion
  else
    rm -rf /companion
  fi
  
  ln -s /share/companion /companion
fi

# Zorg ervoor dat de companion gebruiker eigenaar is
chown -R companion:companion /companion

# Start de originele entrypoint met de gegeven parameters
exec /docker-entrypoint.sh "$@"
