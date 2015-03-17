# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
#sudo bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

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