#!/bin/bash

# Maak zeker dat de configuratiemap bestaat
CONFIG_DIR="/config/companion"
COMPANION_DATA_DIR="/home/companion/.companion"  # Dit is waar Companion waarschijnlijk data opslaat

# Maak de configuratiemap als die niet bestaat
mkdir -p $CONFIG_DIR

# Als de companion data map nog niet bestaat, maak deze
if [ ! -d "$COMPANION_DATA_DIR" ]; then
    mkdir -p $COMPANION_DATA_DIR
fi

# Maak symbolische links voor persistentie
# Identificeer eerst welke submappen er zijn
if [ -z "$(ls -A $COMPANION_DATA_DIR)" ]; then
    # Als de map leeg is, start de applicatie kort om initiële bestanden te maken
    /app/server/express/entrypoint.sh &
    PID=$!
    sleep 5
    kill $PID
fi

# Nu we de structuur hebben, maken we symbolische links
for DIR in $(ls -A $COMPANION_DATA_DIR); do
    # Maak de doelmap als die niet bestaat
    if [ ! -d "$CONFIG_DIR/$DIR" ]; then
        # Als het een bestand is, kopieer het
        if [ -f "$COMPANION_DATA_DIR/$DIR" ]; then
            cp "$COMPANION_DATA_DIR/$DIR" "$CONFIG_DIR/$DIR"
        else
            # Anders maak de map
            mkdir -p "$CONFIG_DIR/$DIR"
            # Kopieer de inhoud als die er is
            if [ "$(ls -A $COMPANION_DATA_DIR/$DIR)" ]; then
                cp -r "$COMPANION_DATA_DIR/$DIR"/* "$CONFIG_DIR/$DIR/"
            fi
        fi
    fi
    
    # Verwijder de originele map/bestand en maak een symbolische link
    rm -rf "$COMPANION_DATA_DIR/$DIR"
    ln -s "$CONFIG_DIR/$DIR" "$COMPANION_DATA_DIR/$DIR"
done

# Start de Companion server
exec /app/server/express/entrypoint.sh
