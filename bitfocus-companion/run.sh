#!/usr/bin/with-contenv bash
# Zorg dat de persistente map bestaat
mkdir -p /data
# Wijzig de eigenaar van /data naar de gebruiker companion
chown companion:companion /data

# Start de officiële entrypoint
exec /docker-entrypoint.sh "$@"
