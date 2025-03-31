#!/usr/bin/env bash
set -e

# Zorg dat /data/v3.5 bestaat (Home Assistant mount /data als persistente opslag)
if [ ! -d "/data/v3.5" ] || [ -z "$(ls -A /data/v3.5)" ]; then
  echo "Kopieer standaardconfiguratie naar persistente opslag /data/v3.5"
  # Controleer of de originele configuratiemap bestaat
  if [ -d "/companion/v3.5" ]; then
    cp -r /companion/v3.5 /data/
  else
    echo "Geen standaardconfiguratie gevonden in /companion/v3.5."
  fi
fi

# Zorg ervoor dat /data/v3.5 de juiste eigenaar heeft (bijvoorbeeld de 'companion' gebruiker)
chown -R companion:companion /data/v3.5

# Stel de environment variable in zodat Companion zijn configuratie uit persistente opslag gebruikt
export COMPANION_CONFIG_BASEDIR=/data/v3.5
echo "Gebruik configuratie uit: $COMPANION_CONFIG_BASEDIR"

# Roep de originele entrypoint aan zodat de Companion applicatie start
exec /docker-entrypoint.sh "$@"
