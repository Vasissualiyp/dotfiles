#!/bin/sh

# Initialize a variable to track if the -n flag is passed
n_flag=0

# Parse command-line options
while getopts "n" opt; do
  case ${opt} in
    n )
      n_flag=1
      ;;
    \? ) echo "Usage: cmd [-n]"
      exit 1
      ;;
  esac
done

# Shift off the options and optional --
shift "$((OPTIND-1))"

# Assume remaining arguments could be the hostname
input_hostname=$1

# Use the provided code block only if the -n flag is passed
if [[ $n_flag -eq 1 ]]; then
  read -p "Enter hostname (press enter to use current hostname): " input_hostname
fi

# Use current hostname if input is empty
if [ -z "$input_hostname" ]; then
    hostname=$(hostname)
else
    hostname=$input_hostname
fi


nix_dir="$HOME/nix"
nix_system_dir="$nix_dir/system"

sudo nixos-rebuild switch --flake "$nix_system_dir/#$hostname"
