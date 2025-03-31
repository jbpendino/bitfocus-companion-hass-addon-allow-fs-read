#!/bin/sh
set -e

# Debug: toon inhoud van /usr/local/bin
echo "Inhoud van /usr/local/bin:"
ls -l /usr/local/bin || echo "Geen inhoud gevonden in /usr/local/bin"

# Zorg dat de /companion map bestaat
mkdir -p /companion

# Persistente opslag:
# Als de gemounte opslag (/data, via addon_config) leeg is, kopieer de standaardconfiguratie (indien aanwezig)
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

# Zoek de companion binary via which
COMP_BIN=$(which companion || true)
if [ -z "$COMP_BIN" ]; then
  echo "Companion binary niet gevonden in PATH."
  exit 1
fi
echo "Companion binary gevonden: $COMP_BIN"

# Voer de companion binary uit met de CMD-argumenten
exec "$COMP_BIN" "$@"
