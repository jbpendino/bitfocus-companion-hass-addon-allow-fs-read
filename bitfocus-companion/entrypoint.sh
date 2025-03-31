#!/usr/bin/env bash
set -e

# Als /data/v3.5 leeg is, kopieer dan de standaardconfiguratie
if [ ! -d "/data/v3.5" ] || [ -z "$(ls -A /data/v3.5)" ]; then
  echo "Kopieer standaardconfiguratie naar persistente opslag /data/v3.5"
  cp -r /companion/v3.5 /data/
fi

# Stel de environment variable in zodat Companion zijn configuratie uit de persistente opslag gebruikt
export COMPANION_CONFIG_BASEDIR=/data/v3.5
echo "Gebruik configuratie uit: $COMPANION_CONFIG_BASEDIR"

# Roep de originele entrypoint aan zodat de Companion applicatie start
exec /docker-entrypoint.sh "$@"
