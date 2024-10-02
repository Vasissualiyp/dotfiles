#!/bin/sh

nix_dir="$HOME/nix"
nix_system_dir="$nix_dir/home-manager/"
hostname=$(uname -n)
#numberOfMonitors=$(xrandr | grep " connected" | wc -l) 
numberOfMonitors=$(hyprctl monitors | grep "Monitor" | wc -l)

# Force at least a single monitor - useful for updating config over ssh
if [ "$numberOfMonitors" -lt 1 ]; then
    numberOfMonitors=1
fi

if [[ "$hostname" == "Vas-Office-Nix" ]]; then
  hostname="$hostname-${numberOfMonitors}mon"
fi

echo "Hostname: " $hostname

export NUMBER_OF_MONITORS="$monitor_number"
home-manager switch --flake "$nix_system_dir.#$hostname"
