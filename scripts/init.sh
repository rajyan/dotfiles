#!/bin/bash

BASE_DIR=${BASE_DIR:-$HOME}

# setup dotfiles
while read -r file
do
    [[ -f $BASE_DIR/$file ]] && mv -f "$BASE_DIR"/"$file" "$BASE_DIR"/"$file".bak
    ln -sv "$BASE_DIR"/dotfiles/"$file" "$BASE_DIR"/"$file"
done < "$BASE_DIR"/dotfiles/list

# install homebrew
eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
[[ "$(uname)" = "Linux" ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew bundle --file "$BASE_DIR"/dotfiles/Brewfile

# install fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
cd .. && rm -rf fonts

