# MBP OSX SETUP
`xcode-select --install`\
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`\
`brew install rbenv`\
`brew install git`\
`curl https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -OL`\
`mv git-completion.bash .git-completion.bash`\
`curl https://github.com/git/git/raw/master/contrib/completion/git-completion.zsh -OL`\
`cp git-completion.zsh .zsh/_git`\
`curl https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh -O`\
`mv git-prompt.sh .git-prompt.sh`\
Add `fpath=(~/.zsh $fpath)` to `~/.zshrc`\
Add `zstyle ':completion:*:*:git:*' script ~/.git-completion.bash` to `~/.zshrc`\
Add `precmd () { __git_ps1 "%n" ":%~$ " "|%s" }` to `~/.zshrc`\
\
`mkdir ~/Documents/Code`\
`ln -s Documents/Code code`\
\
\
`source ~/.git-completion.bash`\
`source ~/.zshrc`\
\
`brew install openssl`\
`echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.zshrc`\
\
`rbenv install 2.7.0` or 3.0 \
\
`brew install postgres`\
`brew install postgis`\
`brew services start postgresql`\
\
Add git SSH: https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
\
\
Visual Studio Code: https://code.visualstudio.com/
