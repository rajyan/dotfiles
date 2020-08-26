#! /bin/zsh

IMG_DIR=$HOME/Desktop/images
BACK_FILE=$IMG_DIR/back.png

img_list=$( find $IMG_DIR -type f -regex '.*\..*' )
rand=$(( $RANDOM % $( echo $img_list | wc -l ) + 1 ))
rand_img=$( echo $img_list | sed -n ${rand}P )
command cp $rand_img $BACK_FILE
