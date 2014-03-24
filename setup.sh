#!/bin/sh

cd $HOME
git clone https://github.com/clear-code/zsh.d.git ~/.zsh.d

cd $(dirname $0)
cd $HOME
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
