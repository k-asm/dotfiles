source ~/.zsh.d/zshrc
[ -f ~/.zsh.d/config/packages.zsh ] && source ~/.zsh.d/config/packages.zsh

case "${OSTYPE}" in
    darwin*)
        fpath=(/usr/local/share/zsh-completions $fpath)
        [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
        ;;
esac
