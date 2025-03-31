#!/usr/bin/with-contenv bashio
# ==============================================================================
# Setup Bitfocus Companion data persistence
# ==============================================================================

# Maak de configuratiemap aan
CONFIG_DIR="/data/companion"
bashio::log.info "Configureren van Bitfocus Companion data directory in ${CONFIG_DIR}"
mkdir -p "${CONFIG_DIR}"

# Zorg dat de companion user toegang heeft
chown -R companion:companion "${CONFIG_DIR}"

# Stel de configuratiedirectory in voor Companion
export COMPANION_CONFIG_BASEDIR="${CONFIG_DIR}"
echo "export COMPANION_CONFIG_BASEDIR=${CONFIG_DIR}" >> /etc/profile
