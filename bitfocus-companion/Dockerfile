# Gebruik de officiële Bitfocus Companion image
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Maak een simpel wrapper script
WORKDIR /

# Maak direct een run script aan
RUN echo '#!/bin/bash\n\
\n\
# Maak de persistente map aan in de share directory\n\
PERSIST_DIR="/share/companion"\n\
mkdir -p $PERSIST_DIR\n\
\n\
# Zorg dat de companion user eigenaar is van de map\n\
chown -R companion:companion $PERSIST_DIR\n\
\n\
# Stel COMPANION_CONFIG_BASEDIR in op de persistente map\n\
export COMPANION_CONFIG_BASEDIR=$PERSIST_DIR\n\
\n\
# Start de originele entrypoint met de nieuwe configuratie directory\n\
exec /docker-entrypoint.sh sh -c "./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir $COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev"' > /run.sh && \
    chmod +x /run.sh

# Overschrijf de default entrypoint
ENTRYPOINT ["/run.sh"]
