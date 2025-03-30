ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.2.2
FROM ${BUILD_FROM}

# Installeer Docker CLI
RUN apk add --no-cache docker-cli

# Kopieer het run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Label voor Home Assistant
LABEL io.hass.version="1.0.0" io.hass.type="addon" io.hass.arch="aarch64|amd64"
