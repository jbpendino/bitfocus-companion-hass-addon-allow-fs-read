FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Kopieer het wrapper script naar de container
COPY run.sh /run.sh

# Debug: controleer of run.sh aanwezig is
RUN ls -l /run.sh

# Converteer CRLF naar LF met awk (verwijdert carriage returns aan het eind van regels)
RUN awk '{ sub(/\r$/, ""); print }' /run.sh > /run.sh.tmp && mv /run.sh.tmp /run.sh

# Maak het script uitvoerbaar
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
