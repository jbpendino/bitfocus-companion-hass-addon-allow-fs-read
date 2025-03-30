#!/bin/bash
set -e

echo "Bitfocus Companion addon starting..."

# Maak data directory voor persistentie
echo "Creating persistent storage directory..."
mkdir -p /data/companion
chmod 777 /data/companion

echo "Setting up port forwarding..."

# Start socat processen op de achtergrond om poorten door te sturen
# Neem aan dat de Companion container op dezelfde host draait maar op andere poorten
socat TCP-LISTEN:8000,fork,reuseaddr TCP:127.0.0.1:18000 &
SOCAT_PID_1=$!
echo "Started socat for port 8000 -> 18000 (PID: $SOCAT_PID_1)"

socat TCP-LISTEN:16622,fork,reuseaddr TCP:127.0.0.1:16622 &
SOCAT_PID_2=$!
echo "Started socat for port 16622 (PID: $SOCAT_PID_2)"

socat TCP-LISTEN:16623,fork,reuseaddr TCP:127.0.0.1:16623 &
SOCAT_PID_3=$!
echo "Started socat for port 16623 (PID: $SOCAT_PID_3)"

socat TCP-LISTEN:28492,fork,reuseaddr TCP:127.0.0.1:28492 &
SOCAT_PID_4=$!
echo "Started socat for port 28492 (PID: $SOCAT_PID_4)"

echo "Port forwarding is set up and running"
echo "Please ensure the Companion container is running outside this addon"
echo "See documentation for instructions on how to start the container"

# Houd het script actief
echo "Addon is now running, keeping process alive..."
# Monitor and display status every minute
while true; do
  sleep 60
  echo "Addon is still running, forwarding ports ($(date))"
  # Check if socat processes are still running
  if kill -0 $SOCAT_PID_1 2>/dev/null; then
    echo "Port 8000 forwarding is active"
  else
    echo "Restarting port 8000 forwarding..."
    socat TCP-LISTEN:8000,fork,reuseaddr TCP:127.0.0.1:18000 &
    SOCAT_PID_1=$!
  fi
  
  if kill -0 $SOCAT_PID_2 2>/dev/null; then
    echo "Port 16622 forwarding is active"
  else
    echo "Restarting port 16622 forwarding..."
    socat TCP-LISTEN:16622,fork,reuseaddr TCP:127.0.0.1:16622 &
    SOCAT_PID_2=$!
  fi
  
  if kill -0 $SOCAT_PID_3 2>/dev/null; then
    echo "Port 16623 forwarding is active"
  else
    echo "Restarting port 16623 forwarding..."
    socat TCP-LISTEN:16623,fork,reuseaddr TCP:127.0.0.1:16623 &
    SOCAT_PID_3=$!
  fi
  
  if kill -0 $SOCAT_PID_4 2>/dev/null; then
    echo "Port 28492 forwarding is active"
  else
    echo "Restarting port 28492 forwarding..."
    socat TCP-LISTEN:28492,fork,reuseaddr TCP:127.0.0.1:28492 &
    SOCAT_PID_4=$!
  fi
done
