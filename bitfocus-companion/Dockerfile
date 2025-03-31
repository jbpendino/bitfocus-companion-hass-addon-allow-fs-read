ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM ${BUILD_FROM}

# Installeer benodigde pakketten
RUN \
    apk add --no-cache \
        nodejs \
        npm \
        bash \
        curl \
        tzdata

# Kopieer startscript
COPY run.sh /
RUN chmod a+x /run.sh

# Maak benodigde directories
RUN \
    mkdir -p /app /data && \
    chmod 777 /app /data

# Configureer volumes
VOLUME /data

# Configureer poorten
EXPOSE 8000 16622 16623 28492

# Configureer opstart
CMD [ "/run.sh" ]
