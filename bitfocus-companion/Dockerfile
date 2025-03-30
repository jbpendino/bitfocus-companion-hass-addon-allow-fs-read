ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.2.2
FROM ${BUILD_FROM}

# Installeer Docker CLI
RUN apk add --no-cache docker-cli

# Kopieer de run.sh naar de root
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Labels voor Home Assistant
LABEL io.hass.name="Bitfocus Companion" \
      io.hass.description="Bitfocus Companion voor het aansturen van een Stream Deck via Companion Satellite" \
      io.hass.version="1.0.0" \
      io.hass.type="addon" \
      io.hass.arch="aarch64|amd64"
