#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

brew tap homebrew/science caskroom/versions
brew install fasd wget R jq httpie youtube-dl m-cli fish 

#brew install scala ruby

brew cask install java spotify chrome firefox dropbox sublime flux intellij-idea-ce vlc atom hyper webstorm

#webdev
brew install watchman flow
brew install yarn

npm install -g react-native-cli yo

apm install nuclide
apm install minimap minimap-find-and-replace minimap-highlight-selected linter open-recent highlight-selected linter-csslint linter-htmlhint linter-jshint auto-detect-indentation less-than-slash atom-ternjs

#code fonts
brew tap caskroom/fonts
brew cask install font-fira-code

#VScode extensions
ext install githistory "vscode-icons" lukehoban.Go robertohuertasm.vscode-icons

gem install bundler

yarn global add structor -g

# from https://coderwall.com/p/euwpig/a-better-git-log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#things not in brew 
#docker
#node and npm
#now.sh
#GO
#VS code

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder AppleShowAllFiles YES

#restore anywhere option of trust
sudo spctl --master-disable
#references
# http://jeroenjanssens.com/2013/09/19/seven-command-line-tools-for-data-science.html
# https://github.com/clarkgrubb/data-tools

#Little command line REST client that you can use in pipelines
#https://github.com/micha/resty
