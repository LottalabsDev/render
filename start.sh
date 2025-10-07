#!/usr/bin/env bash
set -e

# Start VNC server
vncserver $DISPLAY -geometry $RESOLUTION -depth 24

# Launch Firefox (optional)
firefox https://idx.google.com &

# Start noVNC server
cd /usr/share/novnc
websockify --web . 8080 localhost:5901 &
echo "✅ noVNC running on port 8080"
tail -f /dev/null
