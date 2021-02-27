# Dotfiles

![nvim-screenshot](https://i.imgur.com/5Au4jFZ.png)

## Installation

### Using Git and the install script

```bash
git clone https://github.com/vhamed/dotfiles.git && cd dotfiles && source install.sh
```

### Custom your dotfiles via ~/.extra file

You could use this to add a few custom commands without the need to fork this entire repository.

This is mine [extra](./extra)

You could copy in your home directory
```
cp $DOTFILES/extra ~/.extra 
```

or symlink
```
ln -sfn $DOTFILES/extra ~/.extra 
```

### Exlude Vim, Tmux, Zsh

If you don't want any of this cli programs to install and configure you can just drop them from [bin](./bin) folder

### Vim or NeoVim

I actually use NeoVim, but by installing this dotfiles you got [vimrc](./vimrc) file which is almostly the same as nvim.

## Inspired by ...

* [Wincent's dotfiles](https://github.com/wincent/wincent)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
