#!/bin/bash
set -e

# Function to check if the satip_streamer process is running
is_wicardd_running() {
    pgrep -f "/usr/bin/wicardd-*" > /dev/null
}

# Start or restart satip_streamer
echo "Ensuring wicardd-x64 is running..."
if is_wicardd_running; then
    echo "wicardd-x64 is already running."
else
    echo "wicardd-x64 is not running. Starting it..."

    # Add dependencies and environment variables
    export PATH="/usr/bin/:$PATH"
    export PATH1="/usr/bin/tuxbox/:$PATH1"
    /usr/bin/$RUN_OPTS -c /usr/bin/tuxbox/wicardd.conf &
fi

# Infinite loop to keep the script alive
while true; do
    sleep 5
done
