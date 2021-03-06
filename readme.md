# Kristin's dotfiles.

This repo was forked and has since been modified to fit my needs.  See the "Thanks" section at the end of this readme for credits.

## dotfiles Installation

### Using Git and the bootstrap script

The bootstrapper script will pull in the latest version and copy the files to your home folder.

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
cd; curl -#L https://github.com/kristinpeterson/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt}
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing takes place.

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

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/kristinpeterson/dotfiles/fork) instead, though.

## Setting up a new *mac*hine?

The following is a script installs dependencies and other useful binaries.

```bash
source fresh-install.sh
```

Note:
- to set mysql password after install run the following command

```bash
mysqladmin -u root password
```

## Thanks to:

* Simon Owen - This repo was forked from his [dotfiles repo](https://github.com/simonowendesign/dotfiles). He also wrote an [article](http://net.tutsplus.com/tutorials/tools-and-tips/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles/) on how to use these files.
* paulirish - Simon's repo was forked from [paulirish's dotfile repo](https://github.com/paulirish/dotfiles)
* Mathias Bynens - paulirish's repo was forked from [Mathias' dotfiles repo](https://github.com/mathiasbynens/dotfiles/)...the dotfile repo origin is revealed
