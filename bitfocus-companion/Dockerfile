ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM ${BUILD_FROM}

# Installeer benodigde pakketten
RUN \
    apk add --no-cache \
        nodejs \
        npm \
        bash \
        curl

# Maak een companion gebruiker en benodigde directories
RUN \
    adduser -D companion && \
    mkdir -p /app /companion && \
    chown -R companion:companion /app /companion

# Kopieer het startscript
COPY run.sh /
RUN chmod a+x /run.sh

# Configureer volumes
VOLUME /companion

# Poorten
EXPOSE 8000 16622 16623 28492

# Startup command
CMD [ "/run.sh" ]
