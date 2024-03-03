hostname=$(hostname)
sudo nixos-rebuild switch --flake "$HOME/.dotfiles/nix-system/#$hostname"
