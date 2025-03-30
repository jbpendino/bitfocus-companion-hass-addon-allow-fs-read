#!/bin/bash
set -e

echo "Bitfocus Companion proxy addon starting..."

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

# Proxy de Companion container als een Home Assistant container 
# om hoe dan ook de web UI te kunnen bereiken
echo "Starting web server om 8000 naar 8000 te proxy..."
socat TCP-LISTEN:8000,fork TCP:127.0.0.1:8000 &
echo "Starting web server om 16622 naar 16622 te proxy..."
socat TCP-LISTEN:16622,fork TCP:127.0.0.1:16622 &
echo "Starting web server om 16623 naar 16623 te proxy..."
socat TCP-LISTEN:16623,fork TCP:127.0.0.1:16623 &
echo "Starting web server om 28492 naar 28492 te proxy..."
socat TCP-LISTEN:28492,fork TCP:127.0.0.1:28492 &

# Start direct Companion
echo "Starting Companion directly in background..."
cd /usr/local/bin
curl -L -o companion-install.sh https://get.bitfocus.io/companion-linux-${ARCH}.sh
chmod +x companion-install.sh
./companion-install.sh

# Blijf draaien zodat de addon niet stopt
while true; do
  sleep 60
done
