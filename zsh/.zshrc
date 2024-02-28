plugins=(git)

# using pure prompt from:
# https://github.com/sindresorhus/pure

PATH="/usr/local/sbin:$PATH"
PATH="$HOME/opt/anaconda3/bin:$PATH"
PATH+=":$HOME/bin"
export PATH="/usr/local/opt/libxml2/bin:$PATH"

case $HOST in
    (scott)
    export fpath=( "$HOME/dotfiles/zsh/zfunctions" $fpath )
    ;;
esac

export fpath=( "$HOME/dotfiles/zsh/zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt pure

# alias vim
if [[ -a $(which nvim) ]]
    then
    alias vim="nvim"
fi

# making sure colors show correctly
export TERM="xterm-256color"

# makes gs git status
alias gs="git status"

# makes gc git commit
alias gc="git commit -m"

# makes gA git add
alias gA="git add -A && git status"

# makes gC add and commit
alias gC="git add -A && git commit -m"

# makes rcr run clean && run
alias rcr="run clean && run"

# ll
alias ll="ls -AlFGgh"

# featherhead
alias featherhead="$HOME/dotfiles/scripts/featherhead.py"
alias parquethead="$HOME/dotfiles/scripts/parquethead.py"
alias excelhead="$HOME/dotfiles/scripts/excelhead.py"

# creates j
if [[ -a $(which zoxide) ]]
then
    eval "$(zoxide init zsh)"
fi
alias j=zi

# zsh vi mode on command line
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

# locales
export LC_ALL='en_US.UTF-8'

# done.
