# Dotfiles

![nvim-screenshot](https://imgur.com/cVfIwW3.png)

## Requirements

### git

```bash
sudo apt-get install git
```

## Installation

### Using Git and the install script

```bash
git clone https://github.com/vhamed/dotfiles.git && cd dotfiles && source install.sh
```

### Custom your dotfiles via ~/.secrets file

You could use this to add a few custom commands without the need to fork this entire repository.

This is example [secrets](./secrets_template)

Put this file in your home directory or symlink it

```bash
ln -sfn $DOTFILES/secrets ~/.secrets 
```

## Inspired by ...

* [Wincent's dotfiles](https://github.com/wincent/wincent)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
