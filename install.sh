#!/bin/bash

cp "./git/gitconfig" "$HOME/.gitconfig"
cp "./git/gitmessage.txt" "$HOME/.gitmessage.txt"
cp "./git/gitignore_global" "$HOME/.gitignore_global"

cp "./vim/vimrc" "$HOME/.vimrc"

NVIM_FOLDER="$HOME/.config/nvim"
mkdir -p "$NVIM_FOLDER"
cp "./nvim/init.lua" "$NVIM_FOLDER/init.lua"
cp -r "./nvim/lua" "$NVIM_FOLDER/"

cp "./bash/bashrc" "$HOME/.bashrc"
cp "./zsh/zshrc" "$HOME/.zshrc"

cp "./ruby/rubocop.yml" "$HOME/.rubocop.yml"
cp "./alacritty/alacritty.yml" "$HOME/.alacritty.yml"
