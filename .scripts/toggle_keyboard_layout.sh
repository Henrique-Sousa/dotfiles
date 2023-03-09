#!/usr/bin/sh

if [ $(setxkbmap -query | grep layout | awk -F':     ' '{print $2}') = us ]; then
    setxkbmap -layout br
elif [ $(setxkbmap -query | grep layout | awk -F':     ' '{print $2}') = br ]; then
    setxkbmap -layout gr 
elif [ $(setxkbmap -query | grep layout | awk -F':     ' '{print $2}') = gr ]; then
    setxkbmap -layout ru
else
    setxkbmap -layout us
fi
