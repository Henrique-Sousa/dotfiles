sink=$(pactl list sinks | head -1 | sed "s/Sink #//g")
pactl set-sink-mute   $sink toggle 
