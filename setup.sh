#!/bin/sh

if [ ! -d "$HOME/.zsh.d" ]; then
cd $HOME
git clone https://github.com/clear-code/zsh.d.git ~/.zsh.d
fi

if [ ! -d "$HOME/.vim" ]; then
cd $HOME
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

cd $(readlink -f $(dirname $0))
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done