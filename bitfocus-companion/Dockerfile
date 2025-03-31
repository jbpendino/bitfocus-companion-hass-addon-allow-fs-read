ARG BUILD_FROM=ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5
FROM ${BUILD_FROM}

# (Optioneel) Installeer tzdata als je in een andere timezone wilt draaien
RUN apk add --no-cache tzdata

# Kopieer ons aangepaste entrypoint-script naar de container en maak het uitvoerbaar
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Gebruik ons entrypoint.sh als ENTRYPOINT; we hoeven de CMD niet aan te passen
ENTRYPOINT ["/entrypoint.sh"]
