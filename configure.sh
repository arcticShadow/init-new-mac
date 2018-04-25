#!/bin/bash
# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install Mac App Store CLI
brew install mas


#Runs the brewer
brew bundle --file ./Brewfile
