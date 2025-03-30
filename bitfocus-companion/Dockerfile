ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.2.2
FROM ${BUILD_FROM}

# Installeer benodigde pakketten
RUN apk add --no-cache bash curl socat

# Kopieer de rootfs
COPY rootfs /

# Maak het run script uitvoerbaar
RUN chmod a+x /etc/services.d/companion/run

# Labels voor HA
LABEL io.hass.version="1.0.0" io.hass.type="addon" io.hass.arch="aarch64|amd64"
