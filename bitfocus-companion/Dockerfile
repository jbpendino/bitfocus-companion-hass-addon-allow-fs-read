FROM ghcr.io/bitfocus/companion/companion:3.5.3-7770-stable-df70e20b@sha256:ff126d7fa635ae9f64568d522432f7665dc8c846f067302b39ae55eb513472a5

RUN echo '#!/bin/bash\n\
mkdir -p /share/companion\n\
chown -R companion:companion /share/companion\n\
if [ ! -L "/companion" ]; then\n\
  if [ -d "/companion" ] && [ "$(ls -A /companion)" ]; then\n\
    cp -r /companion/* /share/companion/ || true\n\
    rm -rf /companion\n\
  else\n\
    rm -rf /companion\n\
  fi\n\
  ln -s /share/companion /companion\n\
fi\n\
chown -R companion:companion /companion\n\
exec /docker-entrypoint.sh "$@"' > /run.sh && chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["sh", "-c", "./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir $COMPANION_CONFIG_BASEDIR --extra-module-path /app/module-local-dev"]
