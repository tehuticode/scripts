#!/bin/bash

# Define the directories to search
directories=(
  "/home/m0xu_p/.local/share/nvim/lazy/telescope.nvim/lua/telescope/finders"
  "/home/m0xu_p/.local/share/nvim/lazy/telescope.nvim/lua/telescope/builtin"
  "/home/m0xu_p/.local/share/nvim/lazy/telescope.nvim/lua/telescope/config"
  "/home/m0xu_p/.local/share/nvim/lazy/telescope.nvim/lua/telescope/pickers"
)

# Loop through directories and replace vim.tbl_islist with vim.islist
for dir in "${directories[@]}"; do
  find $dir -type f -name "*.lua" -exec sed -i 's/vim.tbl_islist/vim.islist/g' {} \;
done

echo "Replacement complete."

