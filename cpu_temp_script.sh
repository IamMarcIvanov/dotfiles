#!/usr/bin/env bash

FILE1=/sys/class/hwmon/hwmon6/temp5_input
FILE2=/sys/class/hwmon/hwmon5/temp5_input
if [ -f $FILE1 ] ; then
    c1=$(cat /sys/class/hwmon/hwmon6/temp2_input)
    c2=$(cat /sys/class/hwmon/hwmon6/temp3_input)
    c3=$(cat /sys/class/hwmon/hwmon6/temp4_input)
    c4=$(cat /sys/class/hwmon/hwmon6/temp5_input)
else
    c1=$(cat /sys/class/hwmon/hwmon5/temp2_input)
    c2=$(cat /sys/class/hwmon/hwmon5/temp3_input)
    c3=$(cat /sys/class/hwmon/hwmon5/temp4_input)
    c4=$(cat /sys/class/hwmon/hwmon5/temp5_input)
fi
echo $((c1 / 1000))$'\xc2\xb0'C $((c2 / 1000))$'\xc2\xb0'C $((c3 / 1000))$'\xc2\xb0'C $((c4 / 1000))$'\xc2\xb0'C
