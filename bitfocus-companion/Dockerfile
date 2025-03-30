ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.16
FROM ${BUILD_FROM}

# Installeer Docker CLI
RUN apk add --no-cache docker-cli

# Kopieer run.sh naar de root
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
