# Gebruik de officiële Bitfocus Companion image met de arm64 digest
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Maak run.sh script aan in de container
WORKDIR /
RUN echo '#!/bin/bash' > /run.sh && \
    echo '' >> /run.sh && \
    echo '# Maak zeker dat de configuratiemap bestaat' >> /run.sh && \
    echo 'CONFIG_DIR="/config/companion"' >> /run.sh && \
    echo 'COMPANION_DATA_DIR="/home/companion/.companion"' >> /run.sh && \
    echo '' >> /run.sh && \
    echo '# Maak de configuratiemap als die niet bestaat' >> /run.sh && \
    echo 'mkdir -p $CONFIG_DIR' >> /run.sh && \
    echo '' >> /run.sh && \
    echo '# Als de companion data map nog niet bestaat, maak deze' >> /run.sh && \
    echo 'if [ ! -d "$COMPANION_DATA_DIR" ]; then' >> /run.sh && \
    echo '    mkdir -p $COMPANION_DATA_DIR' >> /run.sh && \
    echo 'fi' >> /run.sh && \
    echo '' >> /run.sh && \
    echo '# Maak symbolische links voor persistentie' >> /run.sh && \
    echo 'if [ -z "$(ls -A $COMPANION_DATA_DIR)" ]; then' >> /run.sh && \
    echo '    # Als de map leeg is, start de applicatie kort om initiële bestanden te maken' >> /run.sh && \
    echo '    /app/server/express/entrypoint.sh &' >> /run.sh && \
    echo '    PID=$!' >> /run.sh && \
    echo '    sleep 5' >> /run.sh && \
    echo '    kill $PID' >> /run.sh && \
    echo 'fi' >> /run.sh && \
    echo '' >> /run.sh && \
    echo '# Nu we de structuur hebben, maken we symbolische links' >> /run.sh && \
    echo 'for DIR in $(ls -A $COMPANION_DATA_DIR); do' >> /run.sh && \
    echo '    if [ ! -d "$CONFIG_DIR/$DIR" ]; then' >> /run.sh && \
    echo '        if [ -f "$COMPANION_DATA_DIR/$DIR" ]; then' >> /run.sh && \
    echo '            cp "$COMPANION_DATA_DIR/$DIR" "$CONFIG_DIR/$DIR"' >> /run.sh && \
    echo '        else' >> /run.sh && \
    echo '            mkdir -p "$CONFIG_DIR/$DIR"' >> /run.sh && \
    echo '            if [ "$(ls -A $COMPANION_DATA_DIR/$DIR)" ]; then' >> /run.sh && \
    echo '                cp -r "$COMPANION_DATA_DIR/$DIR"/* "$CONFIG_DIR/$DIR/"' >> /run.sh && \
    echo '            fi' >> /run.sh && \
    echo '        fi' >> /run.sh && \
    echo '    fi' >> /run.sh && \
    echo '    rm -rf "$COMPANION_DATA_DIR/$DIR"' >> /run.sh && \
    echo '    ln -s "$CONFIG_DIR/$DIR" "$COMPANION_DATA_DIR/$DIR"' >> /run.sh && \
    echo 'done' >> /run.sh && \
    echo '' >> /run.sh && \
    echo '# Start de Companion server' >> /run.sh && \
    echo 'exec /app/server/express/entrypoint.sh' >> /run.sh && \
    chmod a+x /run.sh

# Wanneer de container start, voer run.sh uit
CMD [ "/run.sh" ]
