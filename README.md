# Dotfiles

## Screenshots
![screenshot from 2019-03-01 01-48-54](https://user-images.githubusercontent.com/30450467/53608765-52c85400-3bc4-11e9-82f2-7e51b46a813f.png)

## Installation

```sh
sudo apt install git zsh
# Make zsh your default shell (logout user is required for zsh to work)
chsh -s $(which zsh)
mkdir -p ~/Repos/dotfiles
git clone https://github.com/vhamed/dotfiles.git ~/Repos/dotfiles
./install
```
