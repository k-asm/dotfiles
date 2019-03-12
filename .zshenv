setopt no_global_rcs
source ~/.zsh.d/zshenv

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

# for python2
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# for golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# for node
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# for curl
export PATH="/usr/local/opt/curl/bin:$PATH"
