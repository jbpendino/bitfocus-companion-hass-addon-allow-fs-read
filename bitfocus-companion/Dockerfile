ARG BUILD_FROM=ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5
FROM ${BUILD_FROM}

# Zorg dat we in de juiste werkdirectory zitten (/app)
WORKDIR /app


# Kopieer ons run.sh-script naar de container en maak het uitvoerbaar
COPY run.sh /
RUN chmod +x /run.sh

# Zet run.sh als ENTRYPOINT en geef het originele opstartcommando mee als CMD.
# Gebruik een absoluut pad voor de Node binary.
ENTRYPOINT ["/run.sh"]
CMD ["sh", "-c", "/app/node-runtimes/main/bin/node /app/main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir $COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev"]
