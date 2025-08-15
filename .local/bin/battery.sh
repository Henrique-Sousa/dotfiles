#!/usr/bin/bash

status="$(cat /sys/class/power_supply/BAT0/status)";
capacity="$(cat /sys/class/power_supply/BAT0/capacity)";
if [[ ${status} == "Not charging" ]]; then
    mystatus="Idle"
else
    mystatus="${status}"
fi

echo ${mystatus} ${capacity}%
