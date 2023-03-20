# MBP OSX SETUP
`xcode-select --install`\
\
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`\
\
`brew install rbenv`\
`brew install git`\
\
`mkdir ~/Documents/Code`\
`ln -s Documents/Code code`\
\
`source ~/.git-completion.bash`\
`source ~/.zshrc`\
\
`brew install openssl`\
\
`rbenv install 2.7.0`
\
`brew install postgres`\
`brew install postgis`\
`brew services start postgresql@15`\
`brew services start postgresql@15`\
\
`brew install redis`\
`brew services start redis`\
\
`brew tap heroku/brew && brew install heroku`\
\
`brew install libyaml`\
`CONFIGURE_OPTS=--with-openssl-dir=``brew --prefix openssl@1.1`` rbenv install 3.2.1` hack to get around rbenv issue on M2\
`gem install rails`\
`gem install magic_frozen_string_literal`\
\
Add git SSH: https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
\
\
Visual Studio Code: https://code.visualstudio.com/

Postman: https://www.postman.com/downloads/
