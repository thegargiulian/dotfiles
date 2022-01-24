# export ZSH=~/.oh-my-zsh

# ZSH_THEME=""
# DEFAULT_USER=$USER

# ENABLE_CORRECTION="true"

plugins=(git)

# source $ZSH/oh-my-zsh.sh

# using pure prompt from:
# https://github.com/sindresorhus/pure

PATH="/usr/local/sbin:$PATH"
PATH="$HOME/opt/anaconda3/bin:$PATH"
PATH+=":$HOME/bin"
export PATH

case $HOST in
    (eleanor)
    export fpath=( "$HOME/dotfiles/zsh/zfunctions" $fpath )
    ;;
esac

export fpath=( "$HOME/dotfiles/zsh/zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt pure

# use vim commands on the command line
set -o vi

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

# zhead
function zhead () {
    zcat $1 | head
}

# featherhead
alias featherhead="$HOME/dotfiles/scripts/featherhead.py"
alias parquethead="$HOME/dotfiles/scripts/parquethead.py"
alias excelhead="$HOME/dotfiles/scripts/excelhead.py"

# creates j
alias j='xdir=$(fasd -dl | fzf --tac) && cd "$xdir"'
eval "$(fasd --init auto)"

# initialize j
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# locales
export LC_ALL='en_US.UTF-8'

# done.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mariagargiulo/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mariagargiulo/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mariagargiulo/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mariagargiulo/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

