#!/bin/sh

nix_dir="$HOME/nix"
nix_system_dir="$nix_dir/home-manager/"

home-manager switch --flake "$nix_system_dir"
