# Gebruik de officiële Bitfocus Companion image
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Maak een simpel wrapper script - alles op één regel om escape-problemen te vermijden
WORKDIR /
RUN echo "#!/bin/sh" > /run.sh && \
    echo "mkdir -p /share/companion" >> /run.sh && \
    echo "chown -R companion:companion /share/companion" >> /run.sh && \
    echo "export COMPANION_CONFIG_BASEDIR=/share/companion" >> /run.sh && \
    echo "exec /docker-entrypoint.sh sh -c \"./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir \\\$COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev\"" >> /run.sh && \
    chmod +x /run.sh

# Overschrijf de default entrypoint
ENTRYPOINT ["/run.sh"]
