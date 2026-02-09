#!/bin/sh

sink=$(pactl get-default-sink)

case "$sink" in
    "alsa_output.pci-0000_00_1f.3.analog-stereo")   echo "laptop" ;;
    "alsa_output.pci-0000_00_1f.3.hdmi-stereo")     echo "hdmi" ;;
    *)                                              echo "$sink" ;;
esac
