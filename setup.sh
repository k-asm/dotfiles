#!/bin/sh

greadlink -f . > /dev/null 2>&1 && READLINK="greadlink" || READLINK="readlink"
basedir=$($READLINK -f $(dirname $0))

if [ ! -d "$HOME/.zsh.d" ]; then
    cd $HOME
    git clone https://github.com/clear-code/zsh.d.git ~/.zsh.d
fi

if [ ! -d "$HOME/.vim" ]; then
    cd $HOME
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
fi

cd $basedir
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

if [ ! -f "$HOME/.emacs.d/elisp/set-perl5lib.el" ]; then
    wget https://gist.githubusercontent.com/syohex/1333926/raw/set-perl5lib.el -O $HOME/.emacs.d/elisp/set-perl5lib.el
fi
