#!/usr/bin/env zsh

set -ux

DOTSDIR=${DOTSDIR:-$HOME/dotfiles/dots}

# setup dotfiles
for filepath in "$DOTSDIR"/.*
do
    file=${filepath##*/}
    [[ -f "$HOME/$file" ]] && mv -f "$HOME/$file" "$HOME/$file".bak
    ln -svf "$filepath" "$HOME/$file"
done

# init zinit
TERM=xterm-256color zsh -isc exit

