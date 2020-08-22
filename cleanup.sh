for file in list
do
    [ ! -f $file ] && sed "/$file/d"
done

rm -f $(ls -a ~ | grep "^\..*\.bak$")
