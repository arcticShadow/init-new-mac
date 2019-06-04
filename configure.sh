#!/bin/bash
# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install Mac App Store CLI
brew install mas


#Runs the brewer
brew bundle --file ./Brewfile-utils

# Configure some default setting things
defaults write -g AppleInterfaceStyle Dark
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat 2
defaults write -g InitialKeyRepeat 15
#Dock
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock persistent-apps -array  
#Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# This one does not appear to be working
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true


# Link dot dotfiles
ln -s ~/repos/init-new-mac/dotfiles/.zshrc ~/
ln -s ~/repos/init-new-mac/dotfiles/.zshenv ~/
ln -s ~/repos/init-new-mac/dotfiles/.gitconfig ~/
ln -s ~/repos/init-new-mac/dotfiles/.git-commit-message ~/

# Make bin dir
mkdir ~/bin

# Install nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

#Install default node
nvm install stable

#Download Antigen
curl -L git.io/antigen > ~/bin/antigen.zsh

# Change shell
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

# Mac Specific Things
if [ ${uname -s} -eq "Darwin"];
then
  defaults export com.googlecode.iterm2 setup/iterm.plist
fi

# runs the Brewer for Apps. 
brew bundle --file ./Brewfile-apps