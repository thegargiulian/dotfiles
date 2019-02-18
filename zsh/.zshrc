export ZSH=~/.oh-my-zsh

ZSH_THEME=""
DEFAULT_USER=$USER

ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# using pure prompt from: 
# https://github.com/sindresorhus/pure

PATH="/usr/local/sbin:$PATH" 
PATH="$HOME/anaconda3/bin:$PATH" 
PATH+=":$HOME/bin"
export PATH

case $HOST in
    (eleanor)
    export fpath=( "$HOME/dotfiles/zsh/zfunctions" $fpath )
    ;;
esac

autoload -U promptinit; promptinit
prompt pure

# use vim commands on the command line
set -o vi

# alias vim
if [[ -a $(which nvim) ]]
    then
    alias vim="nvim"
fi

# new cv
function cv () {
    if [[ -a "$1" ]]
    then
        if [[ -d "$1" ]]
        then
            cd "$1" &&
            ll
        elif [[ -f "$1" ]]
        then
            cd $(dirname "$1") &&
            nvim $(basename "$1")
        else
            echo "neither a directory nor a file"
        fi
    else
        if [[ $PWD == */$(dirname "$1") ]]
        then
            nvim $(basename "$1")

        else
            if [[ "$1" == */ ]]
            then
                mkdir -p "$1" &&
                cd "$1"
            else
                mkdir -p $(dirname "$1") &&
                cd $(dirname "$1") &&
                nvim $(basename "$1")
            fi
        fi
    fi
}

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

# creates j
alias j='xdir=$(fasd -dl | fzf --tac) && cd "$xdir"'
eval "$(fasd --init auto)"

# zhead
function zhead () {
    zcat $1 | head
}

# featherhead
alias featherhead="$HOME/dotfiles/scripts/featherhead.py"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
