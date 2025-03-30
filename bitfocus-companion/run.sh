#!/bin/bash
set -e

echo "Bitfocus Companion addon starting..."

# Maak data directory voor persistentie
echo "Creating persistent storage directory..."
mkdir -p /data/companion
chmod 777 /data/companion

echo "Starting port forwarding..."
# Start socat processen op de achtergrond om poorten door te sturen
socat TCP-LISTEN:8000,fork,reuseaddr TCP:127.0.0.1:18000 &
socat TCP-LISTEN:16622,fork,reuseaddr TCP:127.0.0.1:16622 &
socat TCP-LISTEN:16623,fork,reuseaddr TCP:127.0.0.1:16623 &
socat TCP-LISTEN:28492,fork,reuseaddr TCP:127.0.0.1:28492 &

# Houd het script actief
echo "Addon is now running, keeping process alive..."
tail -f /dev/null
