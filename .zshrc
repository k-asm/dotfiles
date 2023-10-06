source ~/.zsh.d/zshrc

if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

case "${OSTYPE}" in
    darwin*)
        fpath=(/usr/local/share/zsh-completions $fpath)
        [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
        unset ASDF_DIR
        [[ -s $(brew --prefix asdf)/libexec/asdf.sh ]] && . $(brew --prefix asdf)/libexec/asdf.sh
        ;;
    linux*)
        [ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh
        ;;
esac
