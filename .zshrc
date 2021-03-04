alias ls='ls -G'
alias ll='ls -lG'
alias genpw='LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy'
alias clear_dns='sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset'

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

source ~/.git-prompt.sh
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)
precmd () { __git_ps1 "%n" ":%~$ " "|%s" }
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
eval "$(rbenv init -)"
