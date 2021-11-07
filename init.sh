#!/bin/bash

DOT_DIR=${DOT_DIR:-$HOME/dotfiles}

# setup dotfiles
while read -r file
do
    [[ -f $HOME/$file ]] && mv -f "$HOME/$file" "$HOME/$file".bak
    ln -sv "$DOT_DIR/$file" "$HOME/$file"
done < "$DOT_DIR/list"

# install fonts
git clone https://github.com/powerline/fonts.git --depth=1 && fonts/install.sh && rm -rf fonts

# gnome-terminal
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git && nord-gnome-terminal/src/nord.sh && rm -rf nord-gnome-terminal

