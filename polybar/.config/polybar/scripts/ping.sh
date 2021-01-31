#!/bin/bash
[ -e ~/.cache/wifi-menu-status ] || touch ~/.cache/wifi-menu-status

country=$(cat ~/.cache/vpn-location)
pingCounterLocation="/home/toasterbirb/.cache/pingCounter"
let pingCounter=$(cat $pingCounterLocation || echo "0" > $pingCounterLocation)

function incrementPingCounter {
	let pingCounter+=1
	echo $pingCounter > $pingCounterLocation
}

function resetPingCounter {
	echo "0" > $pingCounterLocation
}

function get_ping {
	PING=$(ping -W 2 -c 1 1.1.1.1 2> /dev/null | awk '/^64/ {print $7}' | cut -d'=' -f2 | cut -d'.' -f1)
}

function vpn_warning {
	wifi_status=$(cat ~/.cache/wifi-menu-status)

	if [[ -z $wifi_status ]]
	then
		echo "!! Ping: "$PING"ms [NO VPN] !!"
		sudo protonvpn r
	else
		echo "---"
	fi
}

# Keskeytä, jos netin uudelleenyhdistys päällä
if [[ "$(cat ~/.cache/wifi-menu-status)" == "vpn-reconnecting" ]]
then
	exit 0
fi

get_ping

if [ -z "$PING" ]
then
	echo "" > ~/.cache/vpn-location
	echo "VPN Killswitch active ($pingCounter/3)"
	incrementPingCounter

	# Wait for wifi connection and then reconnect VPN. If wifi is already
	# connected, reconnect VPN without waiting
	if [[ "$(nmcli -t dev | awk '/^wlp0s20f3/' | cut -d':' -f3)" == "disconnected" ]]
	then

		limit=10

		while [ "$(nmcli -t dev | awk '/^wlp0s20f3/' | cut -d':' -f3)" == "disconnected" ]
		do
			if [[ "$limit" == "0" || -z "$PING" ]]
			then
				echo Killswitch timeout
				exit 0
			fi

			sleep 1
			limit=$(expr ($limit - 10))
			notify-send "Debug" "$(nmcli -t dev | awk '/^wlp0s20f3/' | cut -d':' -f3)"
			get_ping

		done
		
		notify-send -t 2000 -u low "VPN" "Reconnecting VPN..."
		sudo protonvpn r
	else
		if [ $pingCounter -le 3 ]
		then
			#notify-send "PING" "Possible VPN reconnect loop detected"
			exit 0
		fi

		sudo protonvpn c --c ee
		resetPingCounter
	fi
else
	# Reset the ping counter
	resetPingCounter

	# Check if the country value is valid. If not, fix it
	if [[ "$country" == "null" ]] || [[ "$country" == "" ]]
	then
		country=$(sudo protonvpn status | awk '/^Country/ {print $2}')
		echo $country > ~/.cache/vpn-location
	fi

	# Check if VPN is connected and show the ping
	if [[ $(echo "$PING" | grep "sendmsg") ]]
	then
		echo "---"
	else
		numCount="$(wc -c <<< $PING)"
		[ $numCount -le 3 ] && space=" " || space=""
		networkctl status | grep -q proton0 && echo "${space}" $PING"ms ($country)" || vpn_warning
	fi
fi
