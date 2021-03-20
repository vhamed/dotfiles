# Dotfiles

![nvim-screenshot](https://i.imgur.com/5Au4jFZ.png)

## Requirements

### install git

```bash
sudo apt-get install git
```

## Installation

### Using Git and the install script

```bash
git clone https://github.com/vhamed/dotfiles.git && cd dotfiles && source install.sh
```

### Custom your dotfiles via ~/.extra file

You could use this to add a few custom commands without the need to fork this entire repository.

This is example [extra](./extra_template)

Put this file in your home directory or symlink it

```bash
ln -sfn $DOTFILES/extra ~/.extra 
```

### Exlude Vim, Tmux, Zsh

If you don't want any of this cli programs to install and configure you can just drop them from [bin](./bin) folder

### Vim or NeoVim

I actually use NeoVim, but by installing this dotfiles you got [vimrc](./vimrc) file which is almostly the same as nvim.

## Inspired by ...

* [Wincent's dotfiles](https://github.com/wincent/wincent)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
