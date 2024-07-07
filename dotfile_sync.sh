#!/bin/bash

# List of files/folders to sync
DOTFILES=(
  ".bashrc"
  ".tmux.conf"
  # Add more files as needed
)

# Sync files from home directory to .dotfiles directory
for file in "${DOTFILES[@]}"; do
  cp ~/$file ~/.dotfiles/$file
done

echo "Dotfiles synced successfully."

