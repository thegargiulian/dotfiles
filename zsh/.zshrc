# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME=""
DEFAULT_USER=$USER

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# using pure prompt from: 
# https://github.com/sindresorhus/pure

export fpath=( "$HOME/dotfiles/zsh/zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Getting anaconda
# export PATH="$PATH:$HOME/anaconda3/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/anaconda3/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Getting aer-services added to path for HRDAG
export PATH="$HOME/bin:$PATH"
# export PATH="$HOME:$PATH/bin"

# Getting GNU coreutils to be my default
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Defining aliases

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
alias ll="ls -AlFGgh --color='always'"

# creates j
alias j='xdir=$(fasd -dl | fzf --tac) && cd "$xdir"'
eval "$(fasd --init auto)"

# zhead
function zhead () {
    zcat $1 | head
}

# featherhead
alias featherhead="featherhead.py"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
