ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.2.2
FROM ${BUILD_FROM}

# Installeer Docker CLI (om de companion container te kunnen starten)
RUN apk add --no-cache docker-cli-compose

# Kopieer scripts
COPY rootfs /

# Labels
LABEL \
    io.hass.name="Bitfocus Companion" \
    io.hass.description="Bitfocus Companion voor het aansturen van een Stream Deck via Companion Satellite" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="aarch64,amd64"

# Stel een docker-compose bestand samen dat de officiële Companion container start
RUN mkdir -p /etc/docker-compose
RUN echo "version: '3'" > /etc/docker-compose/docker-compose.yaml && \
    echo "services:" >> /etc/docker-compose/docker-compose.yaml && \
    echo "  companion:" >> /etc/docker-compose/docker-compose.yaml && \
    echo "    image: ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b" >> /etc/docker-compose/docker-compose.yaml && \
    echo "    restart: unless-stopped" >> /etc/docker-compose/docker-compose.yaml && \
    echo "    volumes:" >> /etc/docker-compose/docker-compose.yaml && \
    echo "      - /data/companion:/companion" >> /etc/docker-compose/docker-compose.yaml && \
    echo "    ports:" >> /etc/docker-compose/docker-compose.yaml && \
    echo "      - 8000:8000" >> /etc/docker-compose/docker-compose.yaml && \
    echo "      - 16622:16622" >> /etc/docker-compose/docker-compose.yaml && \
    echo "      - 16623:16623" >> /etc/docker-compose/docker-compose.yaml && \
    echo "      - 28492:28492" >> /etc/docker-compose/docker-compose.yaml && \
    echo "    devices:" >> /etc/docker-compose/docker-compose.yaml && \
    echo "      - /dev/bus/usb:/dev/bus/usb" >> /etc/docker-compose/docker-compose.yaml && \
    echo "    environment:" >> /etc/docker-compose/docker-compose.yaml && \
    echo "      - COMPANION_CONFIG_BASEDIR=/companion" >> /etc/docker-compose/docker-compose.yaml
