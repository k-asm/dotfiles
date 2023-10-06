setopt no_global_rcs
source ~/.zsh.d/zshenv

export LANG="ja_JP.UTF-8"
export PAGER="less"

case "${OSTYPE}" in
    darwin*)
        export PATH="`brew --prefix`/opt/python/libexec/bin:$PATH"
        export PATH="`brew --prefix`/opt/curl/bin:$PATH"
        export BYOBU_PREFIX=/opt/homebrew
        ;;
esac

# for golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
