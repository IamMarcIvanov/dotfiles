#!/usr/bin/env bash

stat=$(cat /sys/class/power_supply/BAT0/status)
echo -n $(cut -c1-3 /sys/class/power_supply/BAT0/status)
echo -n ' '
echo -n $(cat /sys/class/power_supply/BAT0/capacity)
echo -n '% '
i=$(cat /sys/class/power_supply/BAT0/current_now)
v=$(cat /sys/class/power_supply/BAT0/voltage_now)
c=$(cat /sys/class/power_supply/BAT0/charge_now)
p=$((i * v))
cap=$(cat /sys/class/power_supply/BAT0/capacity)
if [ $stat == "Discharging" ] ; then
    echo -n 'Rem: '
    mins=$(( 1000000000 * c / p - 10))
    h=$((mins / 60))
    m=$((mins % 60))
    printf %02d $h
    echo -n ':'
    printf %02d $m
    echo ':00'
    if (( $cap < 15 )) ; then
        attn
    fi
elif [ $stat == "Charging" ] ; then
    echo -n 'Rem: '
    f=$(cat /sys/class/power_supply/BAT0/charge_full)
    mins=$(( 1000000000 * (f - c) / p ))
    h=$((mins / 60))
    m=$((mins % 60))
    printf %02d $h
    echo -n ':'
    printf %02d $m
    echo ':00'
else
    echo "Full"
fi
