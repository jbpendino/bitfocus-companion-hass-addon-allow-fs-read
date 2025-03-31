ARG BUILD_FROM=ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5
FROM ${BUILD_FROM}

# Voeg tzdata toe als je in een andere timezone wilt draaien (optioneel)
RUN apk add --no-cache tzdata

# Kopieer run.sh naar de container en maak het uitvoerbaar
COPY run.sh /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
