#!/usr/bin/env bash

echo -n $(nvidia-smi --format=csv,noheader --query-gpu=temperature.gpu) 
echo -n $'\xc2\xb0'C Usage:' ' 
echo -n $(nvidia-smi --format=csv,noheader --query-gpu=memory.used) 
echo -n ' / ' 
echo -n $(nvidia-smi --format=csv,noheader --query-gpu=memory.free) 
echo -n ' Util: ' 
echo $(nvidia-smi --format=csv,noheader --query-gpu=utilization.gpu)
