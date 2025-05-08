#!/bin/sh

# Lock screen first
slock &

# Give slock time to grab the X server
sleep 0.5

# Flush any keyboard events that might wake it instantly
xset dpms force off
sleep 0.5

# Then suspend
systemctl suspend
