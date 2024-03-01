#!/bin/bash

DOTFILES_DIR=$HOME/.dotfiles

# List of dotfiles with their target directories
declare -A FILES_TO_SYMLINK=(
  [vim/.vimrc]="$HOME/"
  [bash/.bashrc]="$HOME/"
  [bash/.bash_profile]="$HOME/"
  [bspwm/bspwmrc]="$HOME/.config/bspwm/"
  [sxhkd/sxhkdrc]="$HOME/.config/sxhkd/"
  [sxhkd/sxhkdrc_office]="$HOME/.config/sxhkd/"
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
      # It's a real file, back it up
      echo "Backing up $targetFile."
      mv "$targetFile" "$targetFile.bak"
    fi
  fi

  # Create the symlink
  echo "Creating symlink for $i."
  ln -s "$sourceFile" "$targetFile"
done

echo "Dotfiles symlinks have been set up."
