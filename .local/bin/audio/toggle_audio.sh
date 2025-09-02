#!/bin/sh

card=alsa_card.pci-0000_00_1f.3
sink=$(pactl get-default-sink)

if [ "$sink" = "alsa_output.pci-0000_00_1f.3.analog-stereo" ]; then
    pactl set-card-profile $card output:hdmi-stereo+input:analog-stereo
elif [ "$sink" = "alsa_output.pci-0000_00_1f.3.hdmi-stereo" ]; then
    pactl set-card-profile $card output:analog-stereo+input:analog-stereo
fi
