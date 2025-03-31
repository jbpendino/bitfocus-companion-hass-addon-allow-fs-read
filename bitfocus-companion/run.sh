#!/usr/bin/env bashio

# Maak de directory voor permanente opslag
mkdir -p /share/companion
chown -R companion:companion /share/companion

# Maak een symlink als deze nog niet bestaat
if [ ! -L "/companion" ]; then
  rm -rf /companion
  ln -s /share/companion /companion
fi
chown -R companion:companion /companion

# Als Companion nog niet is geïnstalleerd, installeer het
if [ ! -d "/app/node_modules" ]; then
  cd /app
  
  # Installeer Companion via npm
  echo "Eerste installatie van Companion, dit kan enkele minuten duren..."
  su -c "npm install @bitfocus/companion@^3.5.3" companion
  
  # Maak een eenvoudig main.js bestand
  echo "#!/usr/bin/env node" > /app/main.js
  echo "const { startCompanion } = require('@bitfocus/companion');" >> /app/main.js
  echo "startCompanion({" >> /app/main.js
  echo "  configDir: '/companion'," >> /app/main.js
  echo "  adminPort: 8000," >> /app/main.js
  echo "  adminAddress: '0.0.0.0'" >> /app/main.js
  echo "});" >> /app/main.js
  
  chown companion:companion /app/main.js
  chmod +x /app/main.js
fi

# Start Companion
cd /app
export COMPANION_CONFIG_BASEDIR=/companion
su -c "node main.js" companion
