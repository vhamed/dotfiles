#!/usr/bin/env bash

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

APT_GET_CMD=$(which apt-get)
TPM_PATH=~/.tmux/plugins/tpm # TMUX PLUGIN MANAGER

if [[ ! -z $APT_GET_CMD ]]; then
  # INSTALL GIT, TMUX, ZSH, VIM
  sudo apt install -y git tmux zsh vim fzf curl

  # INSTALL TMUX PLUGIN MANAGER (TPM)
  git clone https://github.com/tmux-plugins/tpm $TPM_PATH

  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions 

  source ~/.tmux/plugins/tpm/bin/install_plugins

  # INSTALL FAST NODE MANAGER
  curl -fsSL https://fnm.vercel.app/install | bash

  # BUILD NEOVIM FROM SOURCE
  # https://github.com/neovim/neovim/blob/master/BUILD.md
else
  echo "Error can't install packages, only apt is supported"
  exit 1;
fi

