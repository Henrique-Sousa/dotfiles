# back to laptop's sound 

card=$(pactl list cards | head -1 | sed "s/Card #//g")
pactl set-card-profile $card output:analog-stereo+input:analog-stereo
