FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

RUN cat > /run.sh << 'EOF'
#!/bin/bash
set -e

# Zorg ervoor dat de companion map bestaat en de juiste rechten heeft
mkdir -p /share/companion
chown -R companion:companion /share/companion

# Symboolkoppeling maken naar /companion als dit nog niet bestaat
if [ ! -L "/companion" ]; then
  # Als /companion een directory is, verplaats dan de inhoud
  if [ -d "/companion" ] && [ "$(ls -A /companion)" ]; then
    cp -r /companion/* /share/companion/ || true
    rm -rf /companion
  else
    rm -rf /companion
  fi
  
  ln -s /share/companion /companion
fi

# Zorg ervoor dat de companion gebruiker eigenaar is
chown -R companion:companion /companion

# Start de originele entrypoint met de gegeven parameters
exec /docker-entrypoint.sh "$@"
EOF

RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["sh", "-c", "./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir $COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev"]
