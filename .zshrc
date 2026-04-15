alias ls='ls -G'
alias ll='ls -lG'
alias genpw='LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy'
alias clear_dns='sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset'
alias sr='OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES bundle exec spring rspec'
alias aws_vault='aws-vault exec PlatformTeamEngineers-757639335249 --'
alias rubocop_recent="{ git diff HEAD --name-only --diff-filter=MA & git diff origin/master..HEAD --name-only --diff-filter=MA; } | grep ".rb" | sort | uniq | xargs rubocop"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
setopt APPEND_HISTORY

source ~/.git-prompt.sh
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)
# fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit
precmd () { __git_ps1 "%n" ":%~$ " "|%s" }

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/tomas/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export GEOS_LIBRARY_PATH=/opt/homebrew/lib
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCodeInsiders" --args $* ;}

eval "$(rbenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 18.20.7 > /dev/null 2>&1 # Use Node.js v18.20.7 by default
xed() { if [[ $1 == "." && -e *.xcworkspace ]]; then command xed *.xcworkspace; else command xed "$@"; fi; }

autoload -U +X bashcompinit && bashcompinit
