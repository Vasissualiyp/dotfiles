#!/bin/bash

DOTFILES_DIR=$HOME/.dotfiles

# List of dotfiles with their target directories
declare -A FILES_TO_SYMLINK=(
  [vim/.vimrc]="$HOME/"
  [bash/.bashrc]="$HOME/"
  [bash/.bash_profile]="$HOME/"
  [bspwm/bspwmrc]="$HOME/.config/bspwm/"
  [warpd/config]="$HOME/.config/warpd/"
  [stalonetray/stalonetrayrc_Office]="$HOME/.config/stalonetray/"
  [kitty/kitty.conf]="$HOME/.config/kitty/"
  [tmux/tmux.conf]="$HOME/.config/tmux/"
  [redshift/redshift.conf]="$HOME/.config/"
  [sxhkd/sxhkdrc]="$HOME/.config/sxhkd/"
  [zathura/zathurarc]="$HOME/.config/zathura/"
  [zathura/zathurarc-light]="$HOME/.config/zathura/"
  [sxhkd/sxhkdrc_office]="$HOME/.config/sxhkd/"
  [nvim/init.lua]="$HOME/.config/nvim/"
  [nvim/lua]="$HOME/.config/nvim/"
  [nvim/vimscript]="$HOME/.config/nvim/"
  [browsers/qutebrowser/bookmarks]="$HOME/.config/qutebrowser/"
  [browsers/qutebrowser/config.py]="$HOME/.config/qutebrowser/"
  [browsers/qutebrowser/quickmarks]="$HOME/.config/qutebrowser/"
  [polybar]="$HOME/.config/"
  # add other dotfiles here
)

# Create symlinks for the files in their specified target directories
for i in "${!FILES_TO_SYMLINK[@]}"; do
  sourceFile="$DOTFILES_DIR/$i"
  targetDir="${FILES_TO_SYMLINK[$i]}"
  targetFile="${targetDir}$(basename $i)"

  # Ensure the target directory exists
  mkdir -p "$targetDir"

  if [ -e "$targetFile" ]; then
    if [ -L "$targetFile" ]; then
      # It's already a symlink (no action required)
      echo "Symlink exists for $i, skipping."
      continue # Skip to the next file
    else
      #echo "Backing up $targetFile."
      echo "Removing $targetFile."
      rm "$targetFile" #"$targetFile.bak"
    fi
  fi

  # Create the symlink
  echo "Creating symlink for $i."
  ln -s "$sourceFile" "$targetFile"
done

echo "Dotfiles symlinks have been set up."
