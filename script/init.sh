#!/bin/bash

for file in $(cat $HOME/dotfiles/list)
do
    [[ -f $HOME/$file ]] && mv -f $HOME/$file $HOME/$file.bak
    ln -sv $HOME/dotfiles/$file $HOME/$file
done

eval $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)
[[ "$(uname)" = "Linux" ]] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew bundle --file $HOME/dotfiles/Brewfile
