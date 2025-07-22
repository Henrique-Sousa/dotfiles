# sound on secondary monitor 

card=$(pactl list cards | head -1 | sed "s/Card #//g")
pactl set-card-profile $card output:hdmi-stereo+input:analog-stereo
