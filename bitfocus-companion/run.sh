#!/bin/sh
set -e

# Zorg dat de /companion map bestaat
mkdir -p /companion

# Persistente opslag:
# Als de gemounte opslag (/data) leeg is, kopieer dan de standaardconfiguratie (indien aanwezig)
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

# Fix: zorg dat /app/node-runtimes/main bestaat; als deze niet bestaat, maak een symlink naar node18
if [ ! -d "/app/node-runtimes/main" ]; then
  echo "Symlink /app/node-runtimes/main bestaat niet, maak deze aan als een link naar /app/node-runtimes/node18"
  ln -s /app/node-runtimes/node18 /app/node-runtimes/main
fi

echo "Start Companion..."
exec "$@"
