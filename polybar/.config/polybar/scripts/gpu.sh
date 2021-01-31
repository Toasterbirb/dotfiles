#!/bin/bash
data=$(nvidia-smi)
temperature=$(awk '/Default/ {print $3}' <<< $data | sed 's/C//g')
[ -z $temperature ] && echo "" && exit 0

# Continue the script if gpu temperature is more than 60C
if [ $temperature -ge 60 ]
then
	usage=$(awk '/Default/ {print $13}' <<< $data)
	memory=$(awk '/Default/ {print $9}' <<< $data)
	echo "ﳻ $usage |  $temperature°C |  $memory"
else
	echo ""
fi
