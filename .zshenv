source ~/.zsh.d/zshenv

# rbenv is already set by ~/.zsh.d/zshenv
export PATH="$HOME/.plenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

export PATH="$HOME/local/android-studio/sdk/tools:$PATH"
export PATH="$HOME/local/android-studio/sdk/platform-tools:$PATH"

export ANDROID_HOME="$HOME/local/android-studio/sdk/"
export PERL_RL="Perl5"

eval "$(rbenv init -)"
eval "$(plenv init -)"
eval "$(pyenv init -)"
