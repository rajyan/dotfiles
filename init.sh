#!/bin/bash

for file in $(cat list)
do
    [ -f $HOME/$file ] && mv -f $HOME/$file $HOME/$file.bak
    ln -s $HOME/dotfiles/$file $HOME/$file
done

eval $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew bundle
