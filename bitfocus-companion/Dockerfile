ARG BUILD_FROM=ghcr.io/hassio-addons/base:13.2.2
FROM ${BUILD_FROM}

# Kopieer run.sh script
COPY run.sh /
RUN chmod a+x /run.sh

# Definieer entrypoint
CMD [ "/run.sh" ]
