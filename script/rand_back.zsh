#! /bin/zsh

IMG_DIR=$HOME/Desktop/images
NAME_BACKUP=$IMG_DIR/backup
BACK_IMG=$IMG_DIR/back.png

[[ -f $NAME_BACKUP ]] && mv -f $BACK_IMG $(cat $NAME_BACKUP)
cnt=$( find $IMG_DIR -type f -regex '.*\..*' | wc -l )
rand=$(( $RANDOM % $cnt + 1 ))
rand_img=$( find $IMG_DIR -type f -regex '.*\..*' | sed -n ${rand}P )
echo $rand_img >! $NAME_BACKUP
mv -f $rand_img $BACK_IMG
