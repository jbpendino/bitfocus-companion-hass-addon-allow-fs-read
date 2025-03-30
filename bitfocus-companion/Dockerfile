ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.2.2
FROM ${BUILD_FROM}

# Installeer Docker CLI
RUN apk add --no-cache docker-cli

# Kopieer de run.sh naar de root
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

