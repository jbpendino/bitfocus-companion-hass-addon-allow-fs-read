ARG BUILD_FROM
FROM ${BUILD_FROM}

# Definieer een specifieke config directory
ENV COMPANION_CONFIG_BASEDIR=/companion

# Volume voor configuratie persistentie
VOLUME /companion

# Blootstellen van poorten
EXPOSE 8000 16622 16623 28492

# Eenvoudig health check script
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD [ "curl", "-fSsq", "http://localhost:8000/" ]

# Gebruik direct het node commando zonder entrypoint
CMD ["./node-runtimes/main/bin/node", "./main.js", "--admin-address", "0.0.0.0", "--admin-port", "8000", "--config-dir", "/companion", "--extra-module-path", "/app/module-local-dev"]
