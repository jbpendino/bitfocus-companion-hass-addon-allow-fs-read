ARG BUILD_FROM
FROM ${BUILD_FROM}

# Definieer een specifieke config directory
ENV COMPANION_CONFIG_BASEDIR=/companion

# Kopieer ons eigen entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Volume voor configuratie persistentie
VOLUME /companion

# Blootstellen van poorten
EXPOSE 8000 16622 16623 28492

# Eenvoudig health check script
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD [ "curl", "-fSsq", "http://localhost:8000/" ]

# Gebruik ons eigen entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
