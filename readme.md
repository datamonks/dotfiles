# Kristin's dotfiles.

This repo was forked and has since been modified to fit my needs.  See the "Thanks" section at the end of this readme for credits.

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/kristinpeterson/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/mathiasbynens/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Not in the repository, to prevent people from accidentally committing under my name
# Git credentials
GIT_AUTHOR_NAME="kristinpeterson"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="kristinpeterson@example.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Mercurial credentials & paths (get appended to ~/.hgrc)
echo 'username = kristinpeterson <kristinpeterson@me.com>' >> ~/.hgrc
echo '' >> ~/.hgrc
echo '[paths]' >> ~/.hgrc
echo 'remote1 = ssh://hg@bitbucket.org/kristinpeterson/repo1' >> ~/.hgrc
echo 'remote2 = ssh://hg@bitbucket.org/kristinpeterson/repo2' >> ~/.hgrc
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.

## Run the following 3 scripts before `boostrap.sh` when setting up a new Mac

### 1. Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### 2. Install Homebrew formulae

Homebrew requires Xcode Command Line Tools, install Xcode & CLT before installing Homebrew. To install Xcode CLT on Maverics run this command after Xcode has been installed `xcode-select --install`. Then install [Homebrew](http://brew.sh/). `~/.brew` includes installation of useful binaries (git, mercurial, etc) as well as native apps with [`brew cask`](https://github.com/phinze/homebrew-cask):

```bash
./.brew
```

### 3. Install dependencies

Install other dependencies (unrelated to brew).  May consider combining all dependency installs into one file...

```bash
source install-deps.sh
```

## Thanks to:

* Simon Owen - This repo was forked from his [dotfiles repo](https://github.com/simonowendesign/dotfiles). He also wrote an [article](http://net.tutsplus.com/tutorials/tools-and-tips/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles/) on how to use these files.
* paulirish - Simon's repo was forked from [paulirish's dotfile repo](https://github.com/paulirish/dotfiles)
* Mathias Bynens - paulirish's repo was forked from [Mathias' dotfiles repo](https://github.com/mathiasbynens/dotfiles/)...the dotfile repo origin is revealed
