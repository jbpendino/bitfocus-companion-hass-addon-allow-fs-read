#!/bin/sh
set -e

# Zorg dat de /companion map bestaat
mkdir -p /companion

# Debug: toon de huidige inhoud van /app/node-runtimes/main/bin
echo "Inhoud van /app/node-runtimes/main/bin:"
ls -l /app/node-runtimes/main/bin || echo "Map /app/node-runtimes/main/bin niet gevonden"

# Controleer of een node binary beschikbaar is via which
echo "which node:"
which node || echo "node niet in PATH"

# Persistente opslag: als /data leeg is, kopieer standaardconfiguratie (indien aanwezig)
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
# Voer het opstartcommando uit dat via CMD is meegegeven
exec "$@"
