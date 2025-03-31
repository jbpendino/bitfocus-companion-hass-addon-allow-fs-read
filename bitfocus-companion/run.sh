#!/bin/sh
set -e

# Zorg ervoor dat de directory /companion bestaat
mkdir -p /companion

# Als de persistente opslag (/data) leeg is, kopieer de standaardconfiguratie
if [ ! -d "/data" ] || [ -z "$(ls -A /data)" ]; then
  echo "Kopieer standaard configuratie naar /data"
  if [ -d "/companion/v3.5" ]; then
    cp -r /companion/v3.5/* /data/
  else
    echo "Geen standaard configuratie gevonden in /companion/v3.5."
  fi
fi

# Verwijder de originele configuratiemap en maak een symlink naar /data
rm -rf /companion/v3.5
ln -s /data /companion/v3.5

echo "Start Companion..."
exec companion "$@"
