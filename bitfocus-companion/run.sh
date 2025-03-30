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

# Stop eventuele bestaande container
echo "Stopping any existing Companion containers..."
docker ps -a | grep companion && docker rm -f companion 2>/dev/null || true

# Start de container met expliciete socket
echo "Starting Bitfocus Companion container..."
docker run -d --name companion \
  --restart=unless-stopped \
  -v /data/companion:/companion \
  -p 8000:8000 \
  -p 16622:16622 \
  -p 16623:16623 \
  -p 28492:28492 \
  --device=/dev/bus/usb:/dev/bus/usb \
  -e COMPANION_CONFIG_BASEDIR=/companion \
  ${IMAGE}

if [ $? -eq 0 ]; then
  echo "Bitfocus Companion container started successfully!"
else
  echo "Failed to start Bitfocus Companion container"
  exit 1
fi

# Blijf draaien om addon actief te houden en container te monitoren
echo "Starting monitoring loop..."
while true; do
  sleep 30
  # Controleer of container nog draait
  if ! docker ps | grep companion > /dev/null; then
    echo "Container is stopped, restarting..."
    docker start companion || docker run -d --name companion \
      --restart=unless-stopped \
      -v /data/companion:/companion \
      -p 8000:8000 \
      -p 16622:16622 \
      -p 16623:16623 \
      -p 28492:28492 \
      --device=/dev/bus/usb:/dev/bus/usb \
      -e COMPANION_CONFIG_BASEDIR=/companion \
      ${IMAGE}
  fi
done
