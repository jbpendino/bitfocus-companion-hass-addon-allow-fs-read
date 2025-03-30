#!/bin/bash

# Debug: Toon de mapstructuur en processen
echo "==================== DEBUG INFO ===================="
echo "Huidige map:"
pwd
echo "Inhoud van huidige map:"
ls -la
echo "Inhoud van /app (indien het bestaat):"
ls -la /app || echo "/app bestaat niet"
echo "Inhoud van / (root):"
ls -la /
echo "Zoeken naar node executable:"
find / -name "node" -type f 2>/dev/null
echo "Zoeken naar main.js:"
find / -name "main.js" -type f 2>/dev/null
echo "Omgevingsvariabelen:"
env
echo "==================== EINDE DEBUG INFO ===================="

# Zorg ervoor dat de config directory bestaat
mkdir -p /companion
chmod 777 /companion

# Houd de container draaiende om de debug output te kunnen zien
tail -f /dev/null
