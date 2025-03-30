ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.2.2
FROM ${BUILD_FROM}

# Installeer benodigde tools
RUN apk add --no-cache socat

# Kopieer de rootfs
COPY rootfs /

# Labels voor Home Assistant
LABEL io.hass.name="Bitfocus Companion" \
      io.hass.description="Bitfocus Companion voor het aansturen van een Stream Deck via Companion Satellite" \
      io.hass.version="1.0.0" \
      io.hass.type="addon" \
      io.hass.arch="aarch64|amd64"
