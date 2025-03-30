ARG BUILD_FROM
FROM ${BUILD_FROM}

# Kopieer run.sh script
COPY run.sh /
RUN chmod a+x /run.sh

# Zorg dat S6-Overlay weet dat het ons run.sh script moet gebruiken
ENTRYPOINT ["/init"]
