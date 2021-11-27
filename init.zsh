#!/usr/bin/env zsh

set -ex

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

if [[ -z $CI ]]; then
    ./fonts.zsh
fi
