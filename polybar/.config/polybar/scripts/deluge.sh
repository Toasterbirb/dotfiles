#!/bin/bash

CHARGING_STATUS=$(acpi | awk '{print $3}' | sed 's/,//g')
PID=$(pgrep deluged)

if [[ "$CHARGING_STATUS" == "Discharging" ]]
then
	if [[ "$PID" != "" ]]
	then
		pkill deluged
		notify-send -t 2000 -u low "Deluged" "Deluge daemon killed to save battery"
	fi
	echo ""
	exit 0
else
	if [[ "$PID" == "" ]]
	then
		echo ""
		deluged 1> /dev/null
		exit 0
	fi
fi

cache="/home/toasterbirb/.cache/deluge-status"

deluge console status > $cache

download=$(cat $cache | awk '/^Total download/ {print $3 " " $4}')
upload=$(cat $cache | awk '/^Total upload/ {print $3 " " $4}')
#torrentCount=$(cat $cache | awk '/^ Downloading/ {print $2}')

zeroPoint="0.0 KiB/s"
if [[ "$download" == "$zeroPoint" && "$upload" == "$zeroPoint" ]]
then
	echo ""
else
	if [[ "$download" != $zeroPoint && "$upload" == $zeroPoint ]]
	then
		echo " $download"
	elif [[ "$download" == "$zeroPoint" && "$upload" != "$zeroPoint" ]]
	then
		echo " $upload"
	else
		echo " $download |  $upload"
	fi
fi
