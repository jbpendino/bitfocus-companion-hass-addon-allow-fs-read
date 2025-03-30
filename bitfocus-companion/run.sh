#!/bin/bash
set -e

echo "Bitfocus Companion addon starting..."

# Maak data directory voor persistentie
echo "Creating persistent storage directory..."
mkdir -p /data/companion
chmod 777 /data/companion

# Bepaal architectuur voor de juiste image
if [ "$(uname -m)" = "aarch64" ]; then
  echo "Detected ARM64 architecture"
  IMAGE="ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5"
else
  echo "Detected AMD64 architecture"
  IMAGE="ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:813dfd0f40a570f2fd1a4e390edd9e19fa21c790c3b2068af54213f1e2c2f2cf"
fi

# Gebruik directe socat om poorten door te sturen
echo "Starting port forwarding..."
# Start socat processen op de achtergrond om poorten door te sturen
socat TCP-LISTEN:8000,fork,reuseaddr TCP:127.0.0.1:18000 &
socat TCP-LISTEN:16622,fork,reuseaddr TCP:127.0.0.1:16622 &
socat TCP-LISTEN:16623,fork,reuseaddr TCP:127.0.0.1:16623 &
socat TCP-LISTEN:28492,fork,reuseaddr TCP:127.0.0.1:28492 &

# Houd het script actief
echo "Addon is now running, keeping process alive..."
tail -f /dev/null
