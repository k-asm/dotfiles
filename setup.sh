#!/bin/bash

if [ ! -d "$HOME/.zsh.d" ]; then
    cd $HOME
    git clone https://github.com/clear-code/zsh.d.git ~/.zsh.d
fi

cd $PWD
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]
    then
        if [ -d $dotfile ]; then
            [ ! -d "$HOME/$dotfile" ] && mkdir -p "$HOME/$dotfile"
            find "$PWD/$dotfile" -maxdepth 1 -mindepth 1 -name "*" -exec ln -Fis {} "$HOME/$dotfile" \;
        else
        ln -Fis "$PWD/$dotfile" $HOME
        fi
    fi
done

[ ! -d "$HOME/.config/nvim" ] && mkdir -p "$HOME/.config/nvim"
ln -Fis "$PWD/nvim.vim" ~/.config/nvim/init.vim
