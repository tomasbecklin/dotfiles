alias ls='ls -G'
alias ll='ls -lG'
alias genpw='LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy'
alias clear_dns='sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset'
alias sr='OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES bundle exec spring rspec'
alias gst='git status'

rubocop_recent() {
  local -a files

  files=("${(@f)$(
    {
      git diff HEAD --name-only --diff-filter=MA
      git diff origin/master..HEAD --name-only --diff-filter=MA
    } | grep '\.rb$' | sort -u
  )}")

  (( ${#files[@]} == 0 )) && return 0

  rubocop "${files[@]}"
}

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

[[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh
[[ -f ~/.git-completion.bash ]] && zstyle ':completion:*:*:git:*' script ~/.git-completion.bash

fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit -C

precmd() { __git_ps1 "tomas" ":%~$ " "|%s"; }

HEROKU_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/heroku/autocomplete/zsh_setup"
[[ -f "$HEROKU_AC_ZSH_SETUP_PATH" ]] && source "$HEROKU_AC_ZSH_SETUP_PATH"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

eval "$(rbenv init - zsh)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# zsh caches the first path it finds for each command; a stale "ruby" -> /usr/bin
# bypasses rbenv shims even when rbenv version is correct. Resolve from PATH every time.
unsetopt HASH_CMDS

# nvm: load on first use only (avoids slowing every new terminal)
export NVM_DIR="$HOME/.nvm"

_lazy_nvm() {
  unset -f nvm node npm npx _lazy_nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"
  nvm use 18.20.7 >/dev/null 2>&1
}

nvm() {
  _lazy_nvm
  nvm "$@"
}

node() {
  _lazy_nvm
  command node "$@"
}

npm() {
  _lazy_nvm
  command npm "$@"
}

npx() {
  _lazy_nvm
  command npx "$@"
}

xed() {
  if [[ "$1" == "." && -n *.xcworkspace(#qN) ]]; then
    command xed *.xcworkspace
  else
    command xed "$@"
  fi
}

code () {
  # open(1) starts GUI apps with cwd /, so "." would resolve to /. Use absolute paths.
  local -a abs
  local x
  (( $# )) || set -- .
  for x in "$@"; do
    abs+=("${x:A}")
  done
  open -na "Cursor" --args "${abs[@]}"
}

autoload -U +X bashcompinit && bashcompinit
