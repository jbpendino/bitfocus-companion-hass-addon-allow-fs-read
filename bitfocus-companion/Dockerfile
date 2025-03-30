ARG BUILD_FROM
FROM ${BUILD_FROM}

# Label voor Home Assistant
LABEL io.hass.version="1.0.0" io.hass.type="addon" io.hass.arch="aarch64|amd64"

# Definieer de config directory
ENV COMPANION_CONFIG_BASEDIR=/companion

# Volume voor configuratie persistentie
VOLUME /companion

# Poorten die we willen blootstellen
EXPOSE 8000 16622 16623 28492

# Entrypoint en command behouden van originele container
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["./node-runtimes/main/bin/node", "./main.js", "--admin-address", "0.0.0.0", "--admin-port", "8000", "--config-dir", "/companion", "--extra-module-path", "/app/module-local-dev"]

# Werkdirectory instellen op /app waar de applicatie zich bevindt
WORKDIR /app
