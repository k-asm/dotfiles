#!/bin/sh

if [ ! -d "$HOME/.zsh.d" ]; then
    cd $HOME
    git clone https://github.com/clear-code/zsh.d.git ~/.zsh.d
fi

if [ ! -d "$HOME/.vim" ]; then
    cd $HOME
    git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

greadlink -f . > /dev/null 2>&1 && READLINK="greadlink" || READLINK="readlink"
cd $($READLINK -f $(dirname $0))
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]
    then
        if [ -d $dotfile ]; then
            [ ! -d "$HOME/$dotfile" ] && mkdir -p "$HOME/$dotfile"
            find "$PWD/$dotfile" -name "*" -type f -exec ln -Fis {} "$HOME/$dotfile" \;
        else
        ln -Fis "$PWD/$dotfile" $HOME
        fi
    fi
done

if [ ! -f "$HOME/.emacs.d/elisp/set-perl5lib.el" ]; then
    wget https://gist.githubusercontent.com/syohex/1333926/raw/set-perl5lib.el -O $HOME/.emacs.d/elisp/set-perl5lib.el
fi
