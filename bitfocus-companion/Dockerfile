# Gebruik de officiële Bitfocus Companion image met de arm64 digest
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Kopieer het wrapper script naar de container
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Gebruik het wrapper script als CMD
CMD [ "/run.sh" ]
