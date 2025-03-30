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

# Stop any existing container (with error suppression)
echo "Stopping any existing Companion containers..."
docker ps -aq --filter "name=companion" | xargs -r docker rm -f || true

# Set explicit Docker host (for Home Assistant)
export DOCKER_HOST="unix:///var/run/docker.sock"

# Try to check Docker status
echo "Checking Docker status..."
docker info || echo "Warning: Docker info command failed, but continuing..."

# Start container with all needed options
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
  ${IMAGE} || echo "Failed to start container, but keeping addon running"

# Keep the addon running in any case
echo "Entering monitoring loop..."
while true; do
  sleep 30
  
  # Check if container exists and is running
  if docker ps -q --filter "name=companion" | grep -q .; then
    echo "Container is running ($(date))"
  else
    # Try to restart if container exists but not running
    if docker ps -aq --filter "name=companion" | grep -q .; then
      echo "Container exists but stopped, trying to restart..."
      docker start companion || echo "Failed to restart container"
    else
      echo "Container doesn't exist, trying to create..."
      docker run -d --name companion \
        --restart=unless-stopped \
        -v /data/companion:/companion \
        -p 8000:8000 \
        -p 16622:16622 \
        -p 16623:16623 \
        -p 28492:28492 \
        --device=/dev/bus/usb:/dev/bus/usb \
        -e COMPANION_CONFIG_BASEDIR=/companion \
        ${IMAGE} || echo "Failed to start container"
    fi
  fi
done
