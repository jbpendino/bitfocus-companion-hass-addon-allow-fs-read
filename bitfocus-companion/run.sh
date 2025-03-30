#!/bin/bash
set -e

echo "Bitfocus Companion proxy addon starting..."

# Maak data directory voor persistentie
echo "Creating persistent storage directory..."
mkdir -p /data/companion
chmod 777 /data/companion

# Direct naar Companion binary
COMPANION_DIR="/opt/companion"
mkdir -p ${COMPANION_DIR}

# Bepaal architectuur
ARCH=$(uname -m)
echo "Detected architecture: ${ARCH}"

# Download de juiste versie
if [ "${ARCH}" = "aarch64" ]; then
  BINARY_URL="https://github.com/bitfocus/companion/releases/download/v3.5.3/companion-v3.5.3-linux-arm64.tar.gz"
  COMPANION_ARCH="arm64"
else
  BINARY_URL="https://github.com/bitfocus/companion/releases/download/v3.5.3/companion-v3.5.3-linux-x64.tar.gz"
  COMPANION_ARCH="x64"
fi

echo "Downloading and installing Companion..."
echo "Using Companion architecture: ${COMPANION_ARCH}"

# Download en extract
cd ${COMPANION_DIR}
curl -L -o companion.tar.gz ${BINARY_URL}
tar xzf companion.tar.gz
rm companion.tar.gz

# Start companion met de juiste parameters
echo "Starting Companion..."
cd ${COMPANION_DIR}
exec ./companion --admin-address 0.0.0.0 --admin-port 8000 --config-dir /data/companion
