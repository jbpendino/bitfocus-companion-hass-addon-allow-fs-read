ARG BUILD_FROM=ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5
FROM ${BUILD_FROM}

# Stel de werkdirectory in op /app (zoals in de originele image)
WORKDIR /app


# Kopieer run.sh naar de container en maak het uitvoerbaar
COPY run.sh /
RUN chmod +x /run.sh

# Zet run.sh als ENTRYPOINT en gebruik als CMD het originele opstartcommando,
# maar met "node" zodat de PATH gebruikt wordt.
ENTRYPOINT ["/run.sh"]
CMD ["sh", "-c", "node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir $COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev"]
