#!/usr/bin/sh

if [ $(setxkbmap -query | grep layout | awk -F':     ' '{print $2}') = us ]; then
    setxkbmap -layout br
else
    setxkbmap -layout us 
fi
