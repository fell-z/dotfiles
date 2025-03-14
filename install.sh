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

add_line_if_absent () {
  LINE=$1
  FILE=$2
  FILENAME=$(basename "$FILE")

  if [[ -e "$FILE" ]]; then
    if grep -q -x -F "$LINE" "$FILE"; then
      echo "'$LINE' is already sourced in '$FILENAME'."
    else
      echo "'$LINE' isn't sourced in '$FILENAME'."
      echo "adding '$LINE' in '$FILENAME'."
      echo "$LINE" >> "$FILE"
    fi
  else
    echo "'$FILENAME' doesn't exist. Creating and adding '$LINE'."
    {
      echo '#!/bin/zsh'
      echo
      echo "$LINE"
    } > "$FILE"
  fi
}

ZSH="$HOME/.zsh"
if [[ ! -d "$ZSH" ]]; then
  echo "The '$ZSH' directory doesn't exist. Creating now..."
  mkdir -p "$ZSH"
  mkdir -p "$ZSH/autoload"
elif [[ ! -d "$ZSH/autoload" ]]; then
  echo "The '$ZSH/autoload' directory doesn't exist. Creating now..."
  mkdir -p "$ZSH/autoload"
fi

if [[ ! -L "$ZSH/autoload/completion.zsh" && ! -L "$ZSH/autoload/key-bindings.zsh" ]]; then
  echo "'completion.zsh' and 'key-bindings.zsh' aren't linked. Linking now..."
  ln -s "$ROOTDIR/zsh/zsh_dotdir/completion.zsh" "$ZSH/autoload/completion.zsh"
  ln -s "$ROOTDIR/zsh/zsh_dotdir/key-bindings.zsh" "$ZSH/autoload/key-bindings.zsh"
else
  echo "'completion.zsh' and 'key-bindings.zsh' are linked. Skipping..."
fi

link_file_in_home "bashrc"
link_file_in_home "zshrc"
link_file_in_home "vimrc"

LINE='source "$HOME/.dotfiles/shell/path"'
add_line_if_absent "$LINE" "$HOME/.zshenv"
add_line_if_absent "$LINE" "$HOME/.bash_profile"

link_dir_in_XDG_CONFIG "git"
link_dir_in_XDG_CONFIG "alacritty"
link_dir_in_XDG_CONFIG "rubocop"
link_dir_in_XDG_CONFIG "solargraph"
link_dir_in_XDG_CONFIG "nvim"
link_dir_in_XDG_CONFIG "starship"

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
unset -f add_line_if_absent
