#!/usr/bin/env bash

# Add this script to your wm startup file.
machine_name=$(uname -n)
monitor_number=$(xrandr | grep " connected" | wc -l)

# Launch stalonetray{{{
# Kill any existing stalonetray instances
killall -q stalonetray

# Wait until the processes have been shut down
while pgrep -u $UID -x stalonetray >/dev/null; do sleep 1; done

# Launch stalonetray
#stalonetray &

#}}}

# Launch Polybar {{{
DIR="$HOME/.config/polybar/shades"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
#polybar -q main -c "$DIR"/config.ini &
if [ "$machine_name" == "Vas-Desktop-Nix" ]; then
	export MONITOR='DP-0'
	polybar -q main -c "$DIR"/config.ini &

	export MONITOR='DP-3'
	polybar -q secondary -c "$DIR"/config.ini &

	export MONITOR='HDMI-1'
	polybar -q secondary -c "$DIR"/config.ini &
	#polybar -q main -c "$DIR"/configL.ini &
elif [ "$machine_name" == "Vas-Office-Nix" ]; then
	if [ "$monitor_number" -eq 1 ]; then
		export MONITOR='eDP-1'
		polybar -q main-single -c "$DIR"/configOffice.ini &
	elif [ "$monitor_number" -eq 2 ]; then
		export MONITOR='eDP-1'
		polybar -q main-single -c "$DIR"/configOffice.ini &
	elif [ "$monitor_number" -eq 3 ]; then
		export MONITOR='eDP-1'
		polybar -q secondary -c "$DIR"/configOffice.ini &
		export MONITOR='HDMI-1-0'
		polybar -q main -c "$DIR"/configOffice.ini &
		export MONITOR='DP-1-1.9'
		polybar -q secondary -c "$DIR"/configOffice.ini &
	elif [ "$monitor_number" -eq 4 ]; then
		export MONITOR='eDP-1'
		polybar -q secondary -c "$DIR"/configOffice.ini &
		export MONITOR='HDMI-1-0'
		polybar -q main -c "$DIR"/configOffice.ini &
		export MONITOR='DP-1-1.8'
		polybar -q secondary -c "$DIR"/configOffice.ini &
		export MONITOR='DP-1-1.9'
		polybar -q secondary -c "$DIR"/configOffice.ini &
	elif [ "$monitor_number" -eq 5 ]; then
		export MONITOR='eDP-1'
		polybar -q secondary -c "$DIR"/configOffice.ini &
		export MONITOR='HDMI-1-0'
		polybar -q main -c "$DIR"/configOffice.ini &
		export MONITOR='DP-1-1.8'
		polybar -q secondary -c "$DIR"/configOffice.ini &
		export MONITOR='DP-1'
		polybar -q secondary -c "$DIR"/configOffice.ini &
		export MONITOR='DP-1-1.9'
		polybar -q secondary -c "$DIR"/configOffice.ini &
	else
		echo "There are $monitor_number monitors, the polybar configuration only exists for 1, 2, and 4"
	fi
elif [ "$machine_name" == "Vas-HP-Nix" ]; then
	if [ "$monitor_number" -eq 1 ]; then
		export MONITOR='eDP-1'
		polybar -q main-single -c "$DIR"/configOffice.ini &
	elif [ "$monitor_number" -eq 2 ]; then
		export MONITOR='eDP-1'
		polybar -q main-single -c "$DIR"/configOffice.ini &
	else
		echo "There are $monitor_number monitors, the polybar configuration only exists for 1"
	fi
elif [ "$machine_name" == "nixos" ]; then
	if [ "$monitor_number" -eq 1 ]; then
		export MONITOR='HDMI-1'
		polybar -q main-single -c "$DIR"/configOffice.ini &
	else
		echo "There are $monitor_number monitors, the polybar configuration only exists for 1"
	fi
else
	echo "Your desktop configuration is $machine_name, the only accepted ones are Vas-Desktop-Nix and Vas-Office-Nix"
fi
#}}}

#screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)
#TRAY_POS=none
#
#if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
#  MONITOR=$(polybar --list-monitors | cut -d":" -f1) polybar main &
#else
#  primary=$(xrandr --query | grep primary | cut -d" " -f1)
#
#  for m in $screens; do
#    if [[ $primary == $m ]]; then
#        MONITOR=$m polybar -q main -c "DIR"/config.ini &
#    else
#        MONITOR=$m polybar -q secondary -c "DIR"/config.ini &
#    fi
#  done
#fi
