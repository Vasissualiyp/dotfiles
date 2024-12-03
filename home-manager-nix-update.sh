#!/bin/sh

nix_dir="$HOME/nix"
nix_system_dir="$nix_dir/home-manager/"
hostname=$(uname -n)
#numberOfMonitors=$(xrandr | grep " connected" | wc -l) 
numberOfMonitors=$(hyprctl monitors | grep -c "Monitor")
VITURE_NUM=$(hyprctl monitors | grep model | grep -c VITURE)

# Force at least a single monitor - useful for updating config over ssh
if [ "$numberOfMonitors" -lt 1 ]; then
    numberOfMonitors=1
fi

if [[ "$hostname" == "Vas-Office-Nix" ]] || [[ "$hostname" == "Vas-HP-Nix" ]] ; then
  MULTIMON=1
else
  MULTIMON=0
fi

if [[ "$MULTIMON" == 1 ]]; then
  hostname="$hostname-${numberOfMonitors}mon"
fi

if [[ "$hostname" == "Vas-Office-Nix-2mon" ]] || [[ "$hostname" == "Vas-HP-Nix-2mon" ]] ; then
  VITURE_POSSIBLE=1
else
  VITURE_POSSIBLE=0
fi

if [[ "$VITURE_POSSIBLE" == 1 ]]; then
  if [[ "$VITURE_NUM" == 1 ]]; then
    hostname="$hostname-VITURE"
  fi
fi

echo "Hostname: " "$hostname"

export NUMBER_OF_MONITORS="$monitor_number"
rm -rf ~/.gtkrc-2.0*
home-manager switch --flake "$nix_system_dir.#$hostname" -b backup
