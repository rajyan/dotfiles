#!/usr/bin/env zsh

set -ex

DOTSDIR=${DOTSDIR:-"$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"/dots}

# setup dotfiles
for filepath in "$DOTSDIR"/.*
do
    file=${filepath##*/}
    [[ -f "$HOME/$file" ]] && mv -f "$HOME/$file" "$HOME/$file".bak
    ln -svf "$filepath" "$HOME/$file"
done

# init zinit
TERM=xterm-256color zsh -iscex exit

# install fonts
if [[ -z $CI ]]; then
    zsh ./fonts.zsh
fi
