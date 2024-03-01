#!/bin/bash

DOTFILES_DIR=$HOME/.dotfiles

# List of dotfiles
declare -a FILES_TO_SYMLINK=(
  'vim/.vimrc'
  'bash/.bashrc'
  'bash/.bash_profile'
  # add other dotfiles here
)

# Create symlinks in the home directory pointing to files in the .dotfiles directory
for i in "${FILES_TO_SYMLINK[@]}"; do
  sourceFile="$DOTFILES_DIR/$i"
  targetFile="$HOME/$(basename $i)"

  if [ -e "$targetFile" ]; then
    if [ -L "$targetFile" ]; then
      # It's already a symlink (no action required)
      echo "Symlink exists for $i, skipping."
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
