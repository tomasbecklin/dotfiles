. /usr/local/etc/bash_completion.d/git-prompt.sh
. /usr/local/etc/bash_completion.d/git-completion.bash

DULL=0
BRIGHT=1

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37

FG_NULL=00

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47

BG_NULL=00

##
# ANSI Escape Commands
##
ESC="\033"
NORMAL="$ESC[m"
RESET="$ESC[${DULL};${FG_WHITE};${BG_NULL}m"

BLACK="$ESC[${DULL};${FG_BLACK}m"
RED="$ESC[${DULL};${FG_RED}m"
GREEN="$ESC[${DULL};${FG_GREEN}m"
YELLOW="$ESC[${DULL};${FG_YELLOW}m"
BLUE="$ESC[${DULL};${FG_BLUE}m"
VIOLET="$ESC[${DULL};${FG_VIOLET}m"
CYAN="$ESC[${DULL};${FG_CYAN}m"
WHITE="$ESC[${DULL};${FG_WHITE}m"

# BRIGHT TEXT
BRIGHT_BLACK="$ESC[${BRIGHT};${FG_BLACK}m"
BRIGHT_RED="$ESC[${BRIGHT};${FG_RED}m"
BRIGHT_GREEN="$ESC[${BRIGHT};${FG_GREEN}m"
BRIGHT_YELLOW="$ESC[${BRIGHT};${FG_YELLOW}m"
BRIGHT_BLUE="$ESC[${BRIGHT};${FG_BLUE}m"
BRIGHT_VIOLET="$ESC[${BRIGHT};${FG_VIOLET}m"
BRIGHT_CYAN="$ESC[${BRIGHT};${FG_CYAN}m"
BRIGHT_WHITE="$ESC[${BRIGHT};${FG_WHITE}m"

export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi
        local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
        local BRANCH_NAME="${RED}%s${NORMAL}"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(${BRANCH_NAME}|${SINCE_LAST_COMMIT})"`
        echo ${GIT_PROMPT}
    fi
}

function __bundler_ps1 {
  if [ -n "${BUNDLE_GEMFILE-}" ]; then
    printf "${1-(%s) }" "$(dirname $BUNDLE_GEMFILE | xargs basename)"
  fi
}

PS1="\[$GREEN\]\u@\h:\[$NORMAL\]\w \$(grb_git_prompt) \n:p "

alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pg_fix='rm /usr/local/var/postgres/postmaster.pid'
alias pg_status='pg_ctl -D /usr/local/var/postgres status'
alias redis_start='redis-server /usr/local/etc/redis.conf'
alias ngrok='~/ngrok'
alias workers='RAILS_ENV=development foreman start -c assets_worker=1,worker=1'
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export DRONEBASE_API_KEY='bTKW0Hmqhq0Ab464vvJefw'
export GOPATH=$HOME/Code
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias krpanotools='/Applications/krpano-1.19-pr4/krpanotools'
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
# source /usr/local/git/contrib/completion/git-completion.bash
