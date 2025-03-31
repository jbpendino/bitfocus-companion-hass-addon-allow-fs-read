FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Stel de werkdirectory in op de submap met je add-on bestanden
WORKDIR bitfocus-companion

# Kopieer het entrypoint script vanuit de werkdirectory naar de root in de container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["companion"]
