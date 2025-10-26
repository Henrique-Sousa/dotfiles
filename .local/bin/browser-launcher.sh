#!/bin/sh

url="$(printf '' | rofi -dmenu -p 'url:')"

if [ -n "$url" ]; then
    google-chrome-stable "$url";
fi
