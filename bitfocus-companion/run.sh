#!/usr/bin/with-contenv bashio
# ==============================================================================
# Start the Bitfocus Companion container using docker-compose
# ==============================================================================

# Maak de persistente datamap aan
mkdir -p /data/companion
chmod 777 /data/companion

# Start de container via docker-compose
cd /etc/docker-compose
docker-compose up
