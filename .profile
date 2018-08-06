[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

GIT_PROMPT_ONLY_IN_REPO=1 # Use the default prompt when not in a git repo.
GIT_PROMPT_FETCH_REMOTE_STATUS=0 # Avoid fetching remote status
GIT_PROMPT_SHOW_UPSTREAM=0 # Don't display upstream tracking branch
GIT_SHOW_UNTRACKED_FILES=no # Don't count untracked files (no, normal, all)
GIT_PROMPT_THEME=Custom # to edit theme ~/.git-prompt-colors.sh

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
 __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
 source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

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

alias ls='ls -G'
alias ll='ls -lG'

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

function __bundler_ps1 {
  if [ -n "${BUNDLE_GEMFILE-}" ]; then
    printf "${1-(%s) }" "$(dirname $BUNDLE_GEMFILE | xargs basename)"
  fi
}

PS1="\[$GREEN\]\u@\h:\[$NORMAL\]\w \n:p "

alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pg_fix='rm /usr/local/var/postgres/postmaster.pid'
alias pg_status='pg_ctl -D /usr/local/var/postgres status'
alias redis_start='redis-server /usr/local/etc/redis.conf'
alias ngrok='~/ngrok'
alias workers='RAILS_ENV=development foreman start -c assets_worker=1,worker=1'
alias clear_ember_cache='rm -rf node_modules bower_components dis tmp'
alias npm_package_versions='npm list --depth=0'
alias after_pull='bundle & rake db:migrate & rake data:migrate'

export DRONEBASE_API_KEY='bTKW0Hmqhq0Ab464vvJefw'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
