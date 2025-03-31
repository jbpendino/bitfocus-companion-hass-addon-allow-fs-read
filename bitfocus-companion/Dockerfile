# Gebruik de officiële Bitfocus Companion image met de arm64 digest
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Maak een run.sh script om de juiste mappen te configureren
WORKDIR /

COPY run.sh /
RUN chmod a+x /run.sh

# Wanneer de container start, voer run.sh uit
CMD [ "/run.sh" ]
