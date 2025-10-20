#!/usr/bin/sh

option=$(printf "us
br
rus
greek
colemak
dvp (programmer dvorak)
" | awk -F ' ' '{print $1}' | dmenu -l 10)


case "$option" in
    us | br) setxkbmap -layout "$option" ;;
    greek)      setxkbmap -layout gr -variant polytonic ;;
    rus | colemak | dvp) setxkbmap -layout us -variant "$option" ;;
    *) setxkbmap -layout us ;;
esac
