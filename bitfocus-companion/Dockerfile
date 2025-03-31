# Gebruik de officiële Bitfocus Companion image
FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

# Maak het configuratiescript aan
RUN mkdir -p /etc/cont-init.d
RUN echo '#!/bin/bash' > /etc/cont-init.d/companion-config.sh && \
    echo '# Maak de configuratiemap aan' >> /etc/cont-init.d/companion-config.sh && \
    echo 'CONFIG_DIR="/data/companion"' >> /etc/cont-init.d/companion-config.sh && \
    echo 'echo "Configureren van Bitfocus Companion"' >> /etc/cont-init.d/companion-config.sh && \
    echo 'echo "Maken van configuratiemap $CONFIG_DIR"' >> /etc/cont-init.d/companion-config.sh && \
    echo 'mkdir -p "$CONFIG_DIR"' >> /etc/cont-init.d/companion-config.sh && \
    echo 'chown -R companion:companion "$CONFIG_DIR"' >> /etc/cont-init.d/companion-config.sh && \
    echo 'chmod -R 755 "$CONFIG_DIR"' >> /etc/cont-init.d/companion-config.sh && \
    echo 'export COMPANION_CONFIG_BASEDIR="$CONFIG_DIR"' >> /etc/cont-init.d/companion-config.sh && \
    echo 'echo "export COMPANION_CONFIG_BASEDIR=$CONFIG_DIR" >> /etc/environment' >> /etc/cont-init.d/companion-config.sh && \
    chmod +x /etc/cont-init.d/companion-config.sh

# Stel WORKDIR en ENTRYPOINT in
WORKDIR /app
