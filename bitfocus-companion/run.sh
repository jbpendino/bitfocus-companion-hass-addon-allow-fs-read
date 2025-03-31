#!/bin/sh
set -e

# Zorg dat de /companion map bestaat
mkdir -p /companion

# Als de persistente opslag (/data) leeg is, kopieer dan de standaardconfiguratie (indien aanwezig)
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
echo "Huidige PATH: $PATH"

# Stel het PATH expliciet opnieuw in zodat de node binary wordt gevonden
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/app/node-runtimes/main/bin"
echo "Aangepaste PATH: $PATH"

# Voer het originele opstartcommando uit
exec "$@"
