# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# rbenv install
# http://blog.55minutes.com/2013/09/rails-os-x-install-guide/
mkdir ~/.rbenv
cd ~/.rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# add bundler / rubygems-bundler as default gems in rbenv
echo bundler >> ~/.rbenv/default-gems
echo rubygems-bundler >> ~/.rbenv/default-gems

# PostgreSQL setup (installed via .brew)
# initialize database
initdb /usr/local/var/postgres -E utf8
# configure PostgreSQL to run on startup
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Check gems are up to date without installing documentation
gem update --system --no-document
# Install jekyll
gem install jekyll

# Set symlink for Sublime Text 2
# [This hasn't been tested, but should work]
# Enable subl command line tool (for Sublime Text 2)
# First check for existance of ~/bin folder, if !exists create it
if [ ! -d "~/bin" ]; then
  mkdir ~/bin
fi
# then create symbolic link
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# create ~/.vim dir / subdirs, if !exists
# ~/.vim
if [ ! -d "~/.vim" ]; then
  mkdir ~/.vim
fi
# ~/.vim/backups
if [ ! -d "~/.vim" ]; then
  mkdir ~/.vim/backups
fi
# ~/.vim/swaps
if [ ! -d "~/.vim" ]; then
  mkdir ~/.vim/swaps
fi
# ~/.vim/undo
if [ ! -d "~/.vim" ]; then
  mkdir ~/.vim/undo
fi

#!/usr/bin/env bash

# Install Xcode command line tools, a prerequisite for homebrew
xcode-select --install

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php
brew install php55
brew install apple-gcc42  #rbenv install
brew install awscli
brew install autoconf     #rbenv install
brew install git
brew install heroku-toolbelt
brew install libxml2      #rails env dep
brew install libxslt      #rails env dep
brew install libiconv     #rails env dep
brew install mercurial
brew install mysql
brew install node
brew install pkg-config   #rbenv install
brew install postgresql
brew install ruby-build   #rbenv dep
brew install sqlite
brew install tree
brew install zsh

# Install Homebrew Cask https://github.com/phinze/homebrew-cask
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

installcask alfred
installcask cinch
installcask cloudapp
installcask dropbox
installcask firefox
installcask google-app-engine-launcher
installcask google-chrome
installcask google-drive
installcask google-music-manager
installcask growler
installcask intellij-idea
installcask limechat
installcask pycharm
installcask rubymine
installcask sequel-pro
installcask skitch
installcask skype
installcask spectacle
installcask splashtop-personal
installcask splashtop-streamer
installcask sublime-text
installcask synergy
installcask unrarx
installcask vlc

sudo npm install --global gulp

# Remove outdated versions from the cellar
brew cleanup
