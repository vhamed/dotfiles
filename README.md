# My dotfiles

![nvim-screenshot](https://i.imgur.com/3LxJbjX.png)

## Installation (Easy peasy) 
```bash
mkdir -p ~/Repos/dotfiles 
git clone https://github.com/vhamed/dotfiles.git ~/Repos/dotfiles
cd ~/Repos/dotfiles 
chmod +x install.sh
bash install.sh
```

## More install options
```bash
bash install.sh --only link
bash install.sh --except shell
```

## Where to store sensitive commands ?

If you have sensitive commands put them them in `~/.secrets`, and they'll be loaded by zsh
