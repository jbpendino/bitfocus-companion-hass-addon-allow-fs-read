# Gebruik de officiële Bitfocus Companion image
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Zorg ervoor dat /data/companion bestaat en juiste rechten heeft
USER root
RUN mkdir -p /data/companion && \
    chown -R companion:companion /data/companion && \
    chmod -R 755 /data/companion

# Schakel terug naar de original user
USER companion
