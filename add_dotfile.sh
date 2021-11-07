#! /bin/bash

BASE_DIR=${BASE_DIR:-$HOME}

for file in $(git diff --staged --name-only --diff-filter=AR | grep "^\..*")
do 
    echo "$file" >> list
    [[ -f BASE_DIR/$file ]] && mv -f "$BASE_DIR"/"$file" "$BASE_DIR"/"$file".bak
    ln -sv "$BASE_DIR"/dotfiles/"$file" "$BASE_DIR"/"$file"
done
sort -u -o list list
