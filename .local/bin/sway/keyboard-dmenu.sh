#!/usr/bin/sh

option=$(printf "us
br
rus
greek
colemak
dvp (programmer dvorak)
" | rofi -dmenu -l 10 -p Keyboard Layout | awk -F ' ' '{print $1}')

# exit immediately if the user closes rofi without selecting anything
[ -z "$option" ] && exit 0

case "$option" in
    us | br)
        swaymsg "input type:keyboard xkb_layout $option"
        swaymsg 'input type:keyboard xkb_variant ""'
        ;;
    greek)
        swaymsg 'input type:keyboard xkb_layout gr'
        swaymsg 'input type:keyboard xkb_variant polytonic'
        ;;
    rus | colemak | dvp)
        swaymsg 'input type:keyboard xkb_layout us'
        swaymsg "input type:keyboard xkb_variant $option"
        ;;
    *)
        swaymsg 'input type:keyboard xkb_layout us'
        swaymsg 'input type:keyboard xkb_variant ""'
        ;;
esac
