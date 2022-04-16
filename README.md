# Dotfiles (zsh, tmux, nvim)

![nvim-screenshot](https://imgur.com/2dcC9DR.png)

## Steps
### Clone repo

```bash
DESTINATION=~/Repos/dotfiles 
git clone https://github.com/vhamed/dotfiles.git $DESTINATION
```
### cd into dotfiles

```
cd $DESTINATION
```
### Add execute permission

```
chmod +x install.sh
```
### Install 

```bash 
bash install.sh
```
### More installation options
```bash
bash install.sh --only link
```
```bash
bash install.sh --only create
```
```bash
bash install.sh --except shell
```

### Generate global gitconfig file

```bash
DOTFILES_PATH=~/Repos/dotfiles
NAME=Your name
EMAIL=name@email.com
cat > ~/.gitconfig <<EOF
[include] 
    path = ${DOTFILES_PATH}/gitconfig
[user]
name = ${NAME}
email = ${EMAIL}
EOF
``` 
### Secret commands

Store your sensitive commands in `~/.secrets` file, It's not tracked by 
