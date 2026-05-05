#!/bin/sh

network=$(iwctl station wlan0 show | grep "Connected network" | sed 's/Connected network//g' | sed 's/^ \+//g; s/ \+$//g')

case "$network" in
    "VIVOFIBRA-WIFI6-E6A1")     echo -e "%{F#8888FF}wifi" ;;
    "moto g54 5G_1022")         echo -e "%{F#66AA66}hostpost" ;;
    *)                          echo -e "%{F#FF7777}disconnected" ;;
esac
