FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Kopieer het wrapper script naar de container
COPY run.sh /run.sh

# Debug: controleer of run.sh aanwezig is
RUN ls -l /run.sh

# Installeer dos2unix en converteer de line endings van run.sh
RUN apt-get update && apt-get install -y dos2unix && dos2unix /run.sh

# Maak het script uitvoerbaar
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
