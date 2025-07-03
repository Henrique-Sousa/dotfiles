#!/usr/bin/sh

if [ $(setxkbmap -query | grep layout | awk -F':     ' '{print $2}') = us ]; then
    setxkbmap -layout br
elif [ $(setxkbmap -query | grep layout | awk -F':     ' '{print $2}') = br ]; then
    setxkbmap -layout us
else
    setxkbmap -layout us
fi
