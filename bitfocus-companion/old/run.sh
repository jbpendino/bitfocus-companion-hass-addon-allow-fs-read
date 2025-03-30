#!/usr/bin/with-contenv bashio

# Maak de data directory
mkdir -p /data/companion
chmod 777 /data/companion

# Bepaal de juiste image op basis van de architectuur
if [ "$(uname -m)" = "aarch64" ]; then
  IMAGE="ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5"
else
  IMAGE="ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:813dfd0f40a570f2fd1a4e390edd9e19fa21c790c3b2068af54213f1e2c2f2cf"
fi

# Toon een bericht dat we de container starten
bashio::log.info "Starting Bitfocus Companion container..."

# Start de container via Docker
docker run --name bitfocus-companion \
  --restart=unless-stopped \
  -v /data/companion:/companion \
  -p 8000:8000 \
  -p 16622:16622 \
  -p 16623:16623 \
  -p 28492:28492 \
  --device=/dev/bus/usb:/dev/bus/usb \
  -e COMPANION_CONFIG_BASEDIR=/companion \
  ${IMAGE}

# Blijf draaien om de addon niet te laten stoppen
while true; do
  sleep 30
  # Controleer of de container nog draait
  if ! docker ps --filter "name=bitfocus-companion" --format "{{.Names}}" | grep -q "bitfocus-companion"; then
    bashio::log.warning "Bitfocus Companion container is gestopt, herstart..."
    docker start bitfocus-companion || docker run --name bitfocus-companion \
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
