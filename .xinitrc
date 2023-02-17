#!/bins/sh

is_muted() {
    echo "$([ $(pactl -- get-sink-mute 0 | awk -F': ' '{print $2}') == yes ] && echo 🔇 || echo 🔊)";
}

vol() {
    echo "$(pactl -- get-sink-volume 0 | grep % | awk -F' / ' '{print $2}')";
}

kbd_layout() {
    echo $(setxkbmap -query | awk -F':' '{print $2}' | tr -d ' ' | paste -s)
}

get_date() {
    echo $(date +"%T %Z - %a %h %d %Y");
}

bat_stat() {
    echo "$(cat /sys/class/power_supply/BAT0/status)";
}

bat_cap() {
    cap="$(cat /sys/class/power_supply/BAT0/capacity)";
    if (( $cap > 15 )); then
        echo 🔋 ${cap}%;
    else
        echo 🪫 ${cap}%;
    fi
}

while true; do
    xsetroot -name "$(is_muted) $(vol) | 🖮 $(kbd_layout) | $(get_date) | $(bat_stat) $(bat_cap)";
    sleep 1;
done &

exec dwm
