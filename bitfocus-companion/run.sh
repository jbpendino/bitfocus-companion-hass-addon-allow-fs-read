#!/usr/bin/env bashio

CONFIG_DIR="/data/companion"
APP_DIR="/app"

# Maak de config directory aan
mkdir -p ${CONFIG_DIR}
chmod 777 ${CONFIG_DIR}

# Installeer Companion als het nog niet is geïnstalleerd
if [ ! -d "${APP_DIR}/node_modules" ]; then
    cd ${APP_DIR}
    echo "Installeren van Bitfocus Companion. Dit kan enkele minuten duren..."
    
    # Installeer Companion via npm
    npm install @bitfocus/companion@^3.5.3
    
    # Maak een eenvoudig startscript
    cat > ${APP_DIR}/start-companion.js << EOF
const { startCompanion } = require('@bitfocus/companion');

startCompanion({
  configDir: '${CONFIG_DIR}',
  adminPort: 8000,
  adminAddress: '0.0.0.0',
  logRequests: true
}).catch((e) => {
  console.error('Failed to start companion', e);
  process.exit(1);
});
EOF
    
    chmod +x ${APP_DIR}/start-companion.js
fi

# Start Companion
cd ${APP_DIR}
exec node ${APP_DIR}/start-companion.js
