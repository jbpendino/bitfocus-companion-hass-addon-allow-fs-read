FROM alpine:latest

# Installeer benodigde pakketten
RUN apk add --no-cache nodejs npm bash curl

# Maak de nodige mappen aan
RUN mkdir -p /app /companion /share/companion

# Creëer een companion gebruiker
RUN adduser -D companion
RUN chown -R companion:companion /app /companion /share/companion

# Maak een symlink van /share/companion naar /companion
RUN rm -rf /companion && ln -s /share/companion /companion

# Voeg een startup script toe
RUN echo '#!/bin/bash' > /startup.sh && \
    echo 'mkdir -p /share/companion' >> /startup.sh && \
    echo 'chown -R companion:companion /share/companion' >> /startup.sh && \
    echo 'if [ ! -L "/companion" ]; then' >> /startup.sh && \
    echo '  rm -rf /companion' >> /startup.sh && \
    echo '  ln -s /share/companion /companion' >> /startup.sh && \
    echo 'fi' >> /startup.sh && \
    echo 'chown -R companion:companion /companion' >> /startup.sh && \
    echo 'cd /app && exec node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir /companion' >> /startup.sh && \
    chmod +x /startup.sh

# Hier zou je de bestanden van het originele Companion image moeten kopiëren
# Dit vereist een meer complexe multistage build proces

WORKDIR /app
USER companion

# Ports exposed by the container
EXPOSE 8000 16622 16623 28492

ENTRYPOINT ["/startup.sh"]
