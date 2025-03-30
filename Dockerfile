ARG BUILD_FROM
FROM ${BUILD_FROM}

# Gebruik de juiste architectuur (amd64 of arm64)
ARG BUILD_ARCH

# Kopieer run.sh script
COPY run.sh /
RUN chmod a+x /run.sh

# Definieer entrypoint
ENTRYPOINT ["/run.sh"]