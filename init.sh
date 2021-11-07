#!/bin/bash

BASE_DIR=${BASE_DIR:-$HOME}

# setup dotfiles
while read -r file
do
    [[ -f $BASE_DIR/$file ]] && mv -f "$BASE_DIR"/"$file" "$BASE_DIR"/"$file".bak
    ln -sv "$BASE_DIR"/dotfiles/"$file" "$BASE_DIR"/"$file"
done < "$BASE_DIR"/dotfiles/list

# install fonts
git clone https://github.com/powerline/fonts.git --depth=1 && fonts/install.sh && rm -rf fonts

# gnome-terminal
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git && nord-gnome-terminal/src/nord.sh && rm -rf nord-gnome-terminal

