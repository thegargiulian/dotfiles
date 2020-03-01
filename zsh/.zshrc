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
    # make LSH software by Beidi et al. work on eleanor
    export BEIDI_LSH_BLOCKING="/home/mariag/tools/LSHUniqueEntityEstimator/C++Codes/a.out"
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

# creates j
alias j='xdir=$(fasd -dl | fzf --tac) && cd "$xdir"'
eval "$(fasd --init auto)"

# initialize j
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# done.
