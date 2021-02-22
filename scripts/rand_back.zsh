#! /bin/zsh

IMG_DIR=$HOME/Desktop/images
BACK_FILE=$IMG_DIR/back.png

img_list=$( find $IMG_DIR -type f -regex '.*\..*' )
rand=$(( $RANDOM % $( echo $img_list | wc -l ) + 1 ))
rand_img=$( echo $img_list | sed -n ${rand}P )
command cp -f $rand_img $BACK_FILE

export DISPLAY=$(ip route | awk '/default via / {print $3; exit}' 2>/dev/null)
sed -i "s/\(xdebug.remote_host=\)[0-9.]*/\1$DISPLAY/" /home/linuxbrew/.linuxbrew/etc/php/7.4/conf.d/xdebug.ini
