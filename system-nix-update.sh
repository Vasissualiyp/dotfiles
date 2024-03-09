!#/bin/bash
# Prompt for hostname
read -p "Enter hostname (press enter to use current hostname): " input_hostname

# Use current hostname if input is empty
if [ -z "$input_hostname" ]; then
    hostname=$(hostname)
else
    hostname=$input_hostname
fi

nix_dir="$HOME/nix"
nix_system_dir="$nix_dir/system"

sudo nixos-rebuild switch --flake "$nix_system_dir/#$hostname"
