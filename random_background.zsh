#!/usr/bin/env zsh

set -eu

IMG_DIR=$HOME/Desktop/images
BACK_FILE=$IMG_DIR/back.raw

if [[ -d $IMG_DIR ]]; then
    img_list=$( find "$IMG_DIR" -type f \( -iname \*.png -o -iname \*.jpg \) )
    rand=$(( RANDOM % $( echo "$img_list" | wc -l ) + 1 ))
    rand_img=$( echo "$img_list" | sed -n ${rand}P )
    command cp -f "$rand_img" "$BACK_FILE"
fi
