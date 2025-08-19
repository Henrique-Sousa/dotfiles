#!/bin/sh

url="$(printf '' | dmenu -p 'url:')"
if [ -n "$url" ]; then
    qutebrowser "$url" --target window;
fi
