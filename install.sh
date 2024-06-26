#!/bin/bash

SCRIPT=$(readlink -f "$0")
ROOTDIR=$(dirname "$SCRIPT")

exists () {
  command -v "$1" > /dev/null 2>&1
}

link_file_in_home () {
  FILENAME=$1
  ROOTFILE=$(find "$ROOTDIR" -name "$FILENAME")

  if [[ ! -L "$HOME/.$FILENAME" ]]; then
    echo "'$FILENAME' isn't linked. Linking now..."
    ln -s "$ROOTFILE" "$HOME/.$FILENAME"
  else
    echo "'$FILENAME' is linked. Skipping..."
  fi
}

HOME_CONFIG="$HOME/.config"
link_dir_in_XDG_CONFIG () {
  DIRNAME=$1

  if [[ ! -L "$HOME_CONFIG/$DIRNAME" ]]; then
    echo "'$DIRNAME' isn't linked in '$(basename "$HOME_CONFIG")'. Linking now..."
    ln -s "$ROOTDIR/$DIRNAME" "$HOME_CONFIG/$DIRNAME"
  else
    echo "'$DIRNAME' is linked. Skipping..."
  fi
}

ZSH="$HOME/.zsh"
if [[ ! -d "$ZSH" ]]; then
  echo "The '$ZSH' directory doesn't exist. Creating now..."
  mkdir -p "$ZSH"
fi

if [[ ! -L "$ZSH/completion.zsh" && ! -L "$ZSH/key-bindings.zsh" ]]; then
  echo "'completion.zsh' and 'key-bindings.zsh' aren't linked. Linking now..."
  ln -s "$ROOTDIR/zsh/zsh_dotdir/completion.zsh" "$ZSH/completion.zsh"
  ln -s "$ROOTDIR/zsh/zsh_dotdir/key-bindings.zsh" "$ZSH/key-bindings.zsh"
else
  echo "'completion.zsh' and 'key-bindings.zsh' are linked. Skipping..."
fi

link_file_in_home "bashrc"
link_file_in_home "vimrc" 
link_file_in_home "zshrc"
link_file_in_home "zshenv"

link_dir_in_XDG_CONFIG "git"
link_dir_in_XDG_CONFIG "alacritty"
link_dir_in_XDG_CONFIG "rubocop"
link_dir_in_XDG_CONFIG "solargraph"
link_dir_in_XDG_CONFIG "nvim"

if exists i3; then
  link_dir_in_XDG_CONFIG "i3"
  link_dir_in_XDG_CONFIG "i3status"
  link_dir_in_XDG_CONFIG "rofi"
else
  echo "'i3' isn't installed. Skipping linking i3 config files"
fi

unset -f exists
unset -f link_file_in_home
unset -f link_dir_in_XDG_CONFIG
