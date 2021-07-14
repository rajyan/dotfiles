#! /bin/zsh

IMG_DIR=$HOME/Desktop/images
BACK_FILE=$IMG_DIR/back.raw

img_list=$( find -E "$IMG_DIR" -type f -regex '.*\.(png|jpg)' )
rand=$(( RANDOM % $( echo "$img_list" | wc -l ) + 1 ))
rand_img=$( echo "$img_list" | sed -n ${rand}P )
command cp -f "$rand_img" "$BACK_FILE"

