for file in $(cat list)
do
    [ -f $HOME/$flie ] && mv -f $HOME/$file $HOME/$file.bak
    ln -s $HOME/dotfiles/$file $HOME/$file
done
