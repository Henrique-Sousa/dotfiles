#!/usr/bin/sh

sink=$(pactl list sinks | head -1 | sed 's/Sink #//g')

is_muted() {
    [ $(pactl -- get-sink-mute $sink | awk -F': ' '{print $2}') == yes ] && echo 🔇 || echo 🔊;
}

vol() {
    echo "$(pactl -- get-sink-volume $sink | grep % | awk -F' / ' '{print $2}')";
}

kbd_layout() {
    read rules model layout variant options < <(setxkbmap -query | awk -F':' '{print $2}' | tr -d ' ' | paste -s)
    if [ $variant = rus ]; then
        echo "🖮 ${variant}";
    else
        echo "🖮 ${layout}";
    fi
}

get_date() {
    echo $(date +"%H:%M - %a %h %d %Y");
}

bat_stat() {
    echo "$(cat /sys/class/power_supply/BAT0/status)";
}

bat_cap() {
    cap="$(cat /sys/class/power_supply/BAT0/capacity)";
    (( ${cap} > 15 )) && echo "🔋 ${cap}%" || echo "🪫 ${cap}%";
}

while true; do
    xsetroot -name "$(is_muted) $(vol) | $(kbd_layout) | $(get_date) | $(bat_stat) $(bat_cap)";
    sleep 1;
done &
