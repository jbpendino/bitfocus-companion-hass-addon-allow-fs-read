#!/bin/sh
set -e

# Zorg dat de /companion map bestaat
mkdir -p /companion

# Persistente opslag-logica:
# Als de gemounte opslag (/data) leeg is, kopieer de standaardconfiguratie (indien aanwezig)
if [ ! -d "/data" ] || [ -z "$(ls -A /data)" ]; then
  echo "Kopieer standaardconfiguratie naar /data"
  if [ -d "/companion/v3.5" ]; then
    cp -r /companion/v3.5/* /data/
  else
    echo "Geen standaardconfiguratie gevonden in /companion/v3.5."
  fi
fi

# Verwijder de originele configuratiemap en maak een symlink naar /data
rm -rf /companion/v3.5
ln -s /data /companion/v3.5

echo "Start Companion..."

# Probeer eerst de originele entrypoint-script via sh aan te roepen
if [ -f /docker-entrypoint.sh ]; then
  echo "Found /docker-entrypoint.sh, executing via sh..."
  exec sh /docker-entrypoint.sh "$@"
else
  echo "/docker-entrypoint.sh not found. Falling back to CMD..."
  exec "$@"
fi
