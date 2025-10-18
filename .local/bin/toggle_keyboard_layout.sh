#!/usr/bin/sh

layout=$(setxkbmap -query | awk '/layout/ {print $2}')
variant=$(setxkbmap -query | awk '/variant/ {print $2}')

if [ "$layout" = us ] && [ "$variant" != rus ] && [ "$variant" != colemak ] && [ "$variant" != dvp ]; then
    setxkbmap -layout br
elif [ "$layout" = br ]; then
    setxkbmap -layout gr -variant polytonic
elif [ "$layout" = gr ]; then
    setxkbmap -layout us -variant rus
elif [ "$layout" = us ] && [ "$variant" = rus ]; then
    setxkbmap -layout us -variant colemak
elif [ "$layout" = us ] && [ "$variant" = colemak ]; then
    setxkbmap -layout us -variant dvp
elif [ "$layout" = us ] && [ "$variant" = dvp ]; then   # programmer dvorak
    setxkbmap -layout us
fi
