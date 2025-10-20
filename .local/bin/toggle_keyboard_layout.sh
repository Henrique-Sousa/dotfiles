#!/usr/bin/sh

layout=$(setxkbmap -query | awk '/layout/ {print $2}')
variant=$(setxkbmap -query | awk '/variant/ {print $2}')

if [ "$layout" = us ] && [ "$variant" != rus ] && [ "$variant" != colemak ] && [ "$variant" != dvp ]; then
    setxkbmap -layout br
else
    setxkbmap -layout us
fi
