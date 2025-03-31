#!/usr/bin/env bashio

# Maak de directories en juiste rechten
mkdir -p /share/companion
chown -R companion:companion /share/companion

# Maak een symlink van /share/companion naar /companion als het nog geen symlink is
if [ ! -L "/companion" ]; then
  rm -rf /companion
  ln -s /share/companion /companion
fi

# Zet juiste eigenaar
chown -R companion:companion /companion

# Stel de omgevingsvariabele in
export COMPANION_CONFIG_BASEDIR=/companion

# Start Companion
cd /app
su -c "./node-runtimes/main/bin/node ./main.js --admin-address 0.0.0.0 --admin-port 8000 --config-dir /companion --extra-module-path /app/module-local-dev" companion
