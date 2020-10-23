# Dotfiles

![nvim-screenshot](https://i.imgur.com/5Au4jFZ.png)

![terminal-screenshot](https://i.imgur.com/7Bn2nfW.png)

## Installation

### Using Git and the install script

```bash
git clone https://github.com/vhamed/dotfiles.git && cd dotfiles && source install.sh
```

### Custom your dotfiles via ~/.extra file

If `~/.extra` exists, it will be sourced along with the other files.
Here’s an example `~/.extra`:

```bash
# Custom Environment Variables
export EDITOR="nvim";
export REPOS=$HOME/Repos;
export DOTFILES=$REPOS/dotfiles;

# Git credentials
GIT_AUTHOR_NAME="Your Name"
GIT_AUTHOR_EMAIL="Your Email"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Your custom commands 
# any custom shell command
```

### Exlude Vim, Tmux, Zsh

If you don't want any of this cli programs to install and configure you can just drop them from bin/ folder and they will not run

### Vim or NeoVim

I actually use NeoVim, but by installing this dotfiles you got [vimrc](./vimrc) file which is almostly the same as nvim.

## Inspired by ...

* [Wincent's dotfiles](https://github.com/wincent/wincent)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
