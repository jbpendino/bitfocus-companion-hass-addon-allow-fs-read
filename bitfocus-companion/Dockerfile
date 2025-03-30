# Gebruik rechtstreeks de officiële Bitfocus Companion image
# voor arm64 architectuur
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Definieer een specifieke config directory
ENV COMPANION_CONFIG_BASEDIR=/companion

# Volume voor configuratie persistentie
VOLUME /companion

# Blootstellen van poorten
EXPOSE 8000 16622 16623 28492

# Eenvoudig health check script
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD [ "curl", "-fSsq", "http://localhost:8000/" ]

# Behoud het originele entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]

# Originele command
CMD ["./node-runtimes/main/bin/node", "./main.js", "--admin-address", "0.0.0.0", "--admin-port", "8000", "--config-dir", "/companion", "--extra-module-path", "/app/module-local-dev"]
