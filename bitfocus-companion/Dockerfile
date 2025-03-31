# Gebruik de officiële Bitfocus Companion image
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Home Assistant base images voegen S6-overlay toe
# Kopieer rootfs
COPY rootfs /

# Maak de scripts uitvoerbaar
RUN chmod a+x /etc/services.d/companion/run
RUN chmod a+x /etc/services.d/companion/finish

# Zorg dat S6-overlay de startup overneemt
ENTRYPOINT ["/init"]
