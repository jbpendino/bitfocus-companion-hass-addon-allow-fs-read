ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM ${BUILD_FROM}

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Installeer benodigdheden voor het runnen van companion
RUN \
    apk add --no-cache \
        nodejs \
        npm \
        bash \
        curl

# Pull companion container en extraheer bestanden naar /app
RUN \
    apk add --no-cache docker-cli && \
    docker pull ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b && \
    mkdir -p /app && \
    docker save ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b | tar --extract --file - --wildcards '*/layer.tar' && \
    for f in */layer.tar; do tar --extract --file "$f" --directory /app; done && \
    rm -rf */layer.tar && \
    apk del docker-cli

# Maak companion gebruiker en fix permissies
RUN \
    adduser -D companion && \
    mkdir -p /companion && \
    chown -R companion:companion /app /companion

# Configureer command
CMD [ "/run.sh" ]
