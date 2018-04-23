#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install mas

mkdir /tmp/init-mac
cd /tmp/init-mac

cat > /tmp/init-mac/Brewfile << EOF
tap 'caskroom/cask'
cask_args appdir: "/Applications"

install binutils
install diffutils
install ed, args: ["with-default-names"] 
install findutils, args: ["with-default-names"] 
install gawk
install gnu-indent, args: ["with-default-names"] 
install gnu-sed, args: ["with-default-names"] 
install gnu-tar, args: ["with-default-names"] 
install gnu-which, args: ["with-default-names"] 
install gnutls
install grep, args: ["with-default-names"] 
install gzip
install screen
install watch
install wdiff, args: ["with-gettext"] 
install wget

install bash
install gdb
install gpatch
install m4
install make
install tree


install file-formula
install git
install less
install openssh
install homebrew/versions/perl518
install python
install rsync
install svn
install unzip
install vim, args: ["override-system-vi"] 
install zsh


cask gimp
cask java
cask charles
cask wireshark
cask openshot-video-editor
cask 'rambox'
cask 'firefox'
cask 'google-chrome'
cask 'opera'
cask 'spectacle'
cask 'sequel-pro'
cask 'vlc'
cask alfred
cask bitwarden

mas 'XCode', id: 497799835
mas 'Pages', id: 409201541
mas 'Microsoft Remote Desktop', id: 715768417
mas 'Write', id: 848311469
mas 'QVR Client', id: 806101067
EOF

#Runs the installer
brew bundle
