sink=$(pactl list sinks | head -1 | sed "s/Sink #//g")
pactl set-sink-volume $sink -5%    
