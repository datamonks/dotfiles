# up to you (me) if you want to run this as a file or copy paste at your leisure


# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
#sudo bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

##########################################################################
#         Commenting out RVM install / Planning on using rbenv           #
##########################################################################
# https://rvm.into
# rvm for the rubiess
# Paul does: curl -L https://get.rvm.io | bash -s stable --ruby
# I do this one as it adds dependencies as well
# \curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enable
#########################################################################

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

# https://github.com/isaacs/nave
# needs npm, obviously.
# TODO: I think i'd rather curl down the nave.sh, symlink it into /bin and use that for initial node install.
#npm install -g nave


# https://github.com/rupa/z
# z, oh how i love you
# cd
# git clone https://github.com/rupa/z.git
# chmod +x ~/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)

# z binary is already referenced from .bash_profile

# https://github.com/dronir/SpotifyControl
# Spotify Controll Script
#cd ~/code
#git clone git://github.com/dronir/SpotifyControl.git

# https://github.com/jeroenbegyn/VLCControl
# VLC Controll Script
#cd ~/code
#git clone git://github.com/jeroenbegyn/VLCControl.git


# my magic photobooth symlink -> dropbox. I love it.
# first move Photo Booth folder out of Pictures
# then start Photo Booth. It'll ask where to put the library.
# put it in Dropbox/public

# now you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
# then you grab public URL and send off your video message in a heartbeat.


# for the c alias (syntax highlighted cat)
#sudo easy_install Pygments


# chrome canary as default
# on a mac you can set chrome canary as your default inside of Safari preferences :)

# My extra stuff
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