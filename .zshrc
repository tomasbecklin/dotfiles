alias ls='ls -G'
alias ll='ls -lG'
alias genpw='LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy'
alias clear_dns='sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset'
alias mysql=/Applications/MAMP/Library/bin/mysql

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
setopt APPEND_HISTORY

source ~/.git-prompt.sh
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)
precmd () { __git_ps1 "%n" ":%~$ " "|%s" }

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/tomas/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCodeInsiders" --args $* ;}

eval "$(rbenv init -)"
eval "$(nodenv init -)"
