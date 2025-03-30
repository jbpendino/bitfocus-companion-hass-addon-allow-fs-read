ARG BUILD_FROM
FROM ${BUILD_FROM}

# Label voor Home Assistant
LABEL io.hass.version="1.0.0" io.hass.type="addon" io.hass.arch="aarch64|amd64"

# Kopieer ons eigen entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Definieer de config directory
ENV COMPANION_CONFIG_BASEDIR=/companion

# Volume voor configuratie persistentie
VOLUME /companion

# Poorten die we willen blootstellen
EXPOSE 8000 16622 16623 28492

# Gebruik ons eigen entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Werkdirectory instellen op /app waar de applicatie zich bevindt
WORKDIR /app
