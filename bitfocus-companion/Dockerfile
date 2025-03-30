ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.2.2
FROM ${BUILD_FROM}

# Installeer Docker CLI
RUN apk add --no-cache docker-cli bash

# Kopieer de rootfs
COPY rootfs /

# Labels voor HA
LABEL io.hass.version="1.0.0" io.hass.type="addon" io.hass.arch="aarch64|amd64"
