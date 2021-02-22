#! /bin/bash

# clean up list
for file in $(cat $HOME/dotfiles/list)
do
    [[ ! -f $HOME/dotfiles/$file ]] && sed -i "/$file/d" list
done

# clean up .bak files
ls -d -1 "$HOME"/.?*.bak 2> /dev/null | xargs rm -f
