setopt no_global_rcs
source ~/.zsh.d/zshenv

export LANG="ja_JP.UTF-8"
export PAGER="less"

# rbenv is already set by ~/.zsh.d/zshenv
export PATH="$HOME/.plenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.goenv/bin:$PATH"

export PATH="$HOME/local/android-studio/sdk/tools:$PATH"
export PATH="$HOME/local/android-studio/sdk/platform-tools:$PATH"

export ANDROID_HOME="$HOME/local/android-studio/sdk/"
export PERL_RL="Perl5"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which plenv > /dev/null; then eval "$(plenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which goenv > /dev/null; then eval "$(goenv init -)"; fi

case "${OSTYPE}" in
    darwin*)
        export PATH="`brew --prefix`/opt/python/libexec/bin:$PATH"
        export PATH="`brew --prefix`/opt/curl/bin:$PATH"
        ;;
esac

# for golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# for node
export PATH="$HOME/.nodebrew/current/bin:$PATH"
