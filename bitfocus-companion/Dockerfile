# Gebruik de officiële Bitfocus Companion image
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Creëer een eenvoudiger script
WORKDIR /
RUN echo '#!/bin/bash' > /run.sh && \
    echo 'mkdir -p /config/companion' >> /run.sh && \
    echo 'mkdir -p /home/companion/.companion' >> /run.sh && \
    echo 'if [ -z "$(ls -A /home/companion/.companion)" ]; then' >> /run.sh && \
    echo '  echo "Initiële setup van data directories"' >> /run.sh && \
    echo 'else' >> /run.sh && \
    echo '  for item in /home/companion/.companion/*; do' >> /run.sh && \
    echo '    base=$(basename "$item")' >> /run.sh && \
    echo '    if [ ! -e "/config/companion/$base" ]; then' >> /run.sh && \
    echo '      cp -r "$item" "/config/companion/"' >> /run.sh && \
    echo '    fi' >> /run.sh && \
    echo '    rm -rf "$item"' >> /run.sh && \
    echo '    ln -s "/config/companion/$base" "$item"' >> /run.sh && \
    echo '  done' >> /run.sh && \
    echo 'fi' >> /run.sh && \
    echo 'exec /app/server/express/entrypoint.sh' >> /run.sh && \
    chmod +x /run.sh

CMD [ "/run.sh" ]
