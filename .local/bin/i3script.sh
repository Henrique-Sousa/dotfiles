#!/bin/bash

# shell scipt to prepend i3status with more stuff

i3status --config ~/.config/i3status/config | while :
do
        read line
        read rules model layout variant options < <(setxkbmap -query | awk -F':' '{print $2}' | tr -d ' ' | paste -s)
        if [ "$variant" = rus ]; then
            echo "🖮 ${variant} | $line" || exit 1;
        else
            echo "🖮 ${layout} | $line" || exit 1;
        fi
done

