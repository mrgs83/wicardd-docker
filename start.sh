#!/bin/bash
set -e

# Start the specified version of wicardd
echo "Starting wicardd with options: $RUN_OPTS"
/usr/local/bin/$RUN_OPTS -c /config/wicardd.conf &

# Infinite loop to keep the script alive
while true; do
    sleep 5
done
