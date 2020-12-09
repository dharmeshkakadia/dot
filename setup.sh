#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

brew tap homebrew/science caskroom/versions
brew install fasd wget R jq httpie youtube-dl m-cli fish hub exa csvkit bat 

#brew install scala ruby
brew install fzf
brew cask install java spotify chrome firefox dropbox sublime flux intellij-idea-ce vlc atom hyper webstorm
brew install asdf
#brew install pandoc whalebrew
#webdev
brew install watchman flow
brew cask install ngrok

# Python
brew cask install anaconda

brew install kubectx
brew install tree
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
yarn global add lighthouse

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

# https://apple.stackexchange.com/questions/159548/prevent-auto-pairing-for-certain-devices-bluetooth
sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist DontPageAudioDevices 1

#Little command line REST client that you can use in pipelines
#https://github.com/micha/resty
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/sublime
