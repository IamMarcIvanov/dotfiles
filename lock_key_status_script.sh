#!/usr/bin/env bash

st=$(xset q | grep Caps)
arr=($st)
echo -n "Caps: "${arr[3]}
echo "  Num: "${arr[7]}

