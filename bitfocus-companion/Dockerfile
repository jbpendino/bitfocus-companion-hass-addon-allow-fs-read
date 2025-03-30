ARG BUILD_FROM
FROM ${BUILD_FROM}

# Kopieer run.sh script
COPY run.sh /
RUN chmod a+x /run.sh

# Start via run.sh
CMD [ "/run.sh" ]
