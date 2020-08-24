#! /bin/bash

for file in $(git diff --staged --name-only --diff-filter=AR | grep "^\..*")
do 
    echo $file >> list
    [[ -f $HOME/$file ]] && mv -f $HOME/$file $HOME/$file.bak
    ln -sv $HOME/dotfiles/$file $HOME/$file
done
sort -u -o list list
