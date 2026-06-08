#!/usr/bin/sh

layout_name=$(swaymsg -t get_inputs -r | jq -r '.[] | select(.type=="keyboard") | .xkb_active_layout_name' | head -n1)

if [ "$layout_name" = "English (US)" ]; then
    swaymsg 'input type:keyboard xkb_layout br'
    swaymsg 'input type:keyboard xkb_variant ""'
else
    swaymsg 'input type:keyboard xkb_layout us'
    swaymsg 'input type:keyboard xkb_variant ""'
fi
