#!/bin/sh

url="$(printf '' | rofi -dmenu -p 'url:')"

if [ -n "$url" ]; then
    google-chrome-stable --new-window "$url";
fi
