source ~/.zsh.d/zshrc

if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

case "${OSTYPE}" in
    darwin*)
        fpath=(/usr/local/share/zsh-completions $fpath)
        [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
        [[ -s $(brew --prefix asdf)/asdf.sh ]] && . $(brew --prefix asdf)/asdf.sh
        ;;
    linux*)
        [ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh
        ;;
esac

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/workspace/google-cloud-sdk/path.zsh.inc' ]; then source '~/workspace/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/workspace/google-cloud-sdk/completion.zsh.inc' ]; then source '~/workspace/google-cloud-sdk/completion.zsh.inc'; fi
