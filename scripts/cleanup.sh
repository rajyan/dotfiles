#! /bin/bash

BASE_DIR=${BASE_DIR:-$HOME}

# clean up list
while read -r file
do
  [[ ! -f $HOME/dotfiles/$file ]] && sed -i "/$file/d" list
done < "$BASE_DIR"/dotfiles/list

# clean up .bak files
ls -d -1 "$HOME"/.?*.bak 2> /dev/null | xargs rm -f
