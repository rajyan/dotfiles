#! /bin/bash

BACKGROUND_DIR=$HOME/Desktop/images
BACKUP_FILE=$BACKGROUND_DIR/backup

[[ -f $BACKUP_FILE ]] && mv $BACKGROUND_DIR/background $(cat $BACKUP_FILE)
cnt=$( find ${BACKGROUND_DIR} -type f -regex '.*\..*' | wc -l )
rand=$(( $RANDOM % $cnt + 1 ))
back_img=$( find ${BACKGROUND_DIR} -type f -regex '.*\..*' | sed -n ${rand}P )
echo $back_img
echo $back_img > $BACKUP_FILE
mv $back_img $BACKGROUND_DIR/background
