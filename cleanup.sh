#! /bin/bash
for file in $(cat list)
do
    [ ! -f $file ] && sed -i "/$file/d" list
done

ls -a $HOME | grep "^\..*\.bak$" | xargs rm -f
