#!/bin/bash

BASE_DIR=${BASE_DIR:-$HOME}

while read -r file
do
    [[ -f $BASE_DIR/$file ]] && mv -f "$BASE_DIR"/"$file" "$BASE_DIR"/"$file".bak
    ln -sv "$BASE_DIR"/dotfiles/"$file" "$BASE_DIR"/"$file"
done < "$BASE_DIR"/dotfiles/list

eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
[[ "$(uname)" = "Linux" ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew bundle --file "$BASE_DIR"/dotfiles/Brewfile
