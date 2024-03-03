
# Prompt for hostname
read -p "Enter hostname (press enter to use current hostname): " input_hostname

# Use current hostname if input is empty
if [ -z "$input_hostname" ]; then
    hostname=$(hostname)
else
    hostname=$input_hostname
fi

sudo nixos-rebuild switch --flake "$HOME/.dotfiles/nix-system/#$hostname"
