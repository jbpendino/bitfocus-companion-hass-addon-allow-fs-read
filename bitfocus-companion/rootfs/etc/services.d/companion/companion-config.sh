#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configureer Bitfocus Companion
# ==============================================================================

# Maak de configuratiemap aan
CONFIG_DIR="/data/companion"
bashio::log.info "Configureren van Bitfocus Companion"
bashio::log.info "Maken van configuratiemap $CONFIG_DIR"

mkdir -p "$CONFIG_DIR"
chown -R companion:companion "$CONFIG_DIR"
chmod -R 755 "$CONFIG_DIR"

# Stel configuratiemap in
export COMPANION_CONFIG_BASEDIR="$CONFIG_DIR"
echo "export COMPANION_CONFIG_BASEDIR=$CONFIG_DIR" >> /etc/environment
