FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Kopieer rootfs
COPY rootfs /

# Maak script uitvoerbaar
RUN chmod +x /etc/services.d/companion/run
