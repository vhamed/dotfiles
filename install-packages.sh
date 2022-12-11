#!/usr/bin/env bash

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

APT_GET_CMD=$(which apt-get)
NEOVIM_PATH=~/Repos/neovim 
TPM_PATH=~/.tmux/plugins/tpm # TMUX PLUGIN MANAGER
VIM_PLUG_PATH=~/.vim/autoload/plug.vim
NVIM_PLUG_PATH="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim 

if [[ ! -z $APT_GET_CMD ]]; then
  # INSTALL GIT, TMUX, ZSH, VIM
  sudo apt install -y git tmux zsh vim

  # INSTALL TMUX PLUGIN MANAGER (TPM)
  git clone https://github.com/tmux-plugins/tpm $TPM_PATH

  # INSTALL TMUX PLUGINS
  ~/.tmux/plugins/tpm/bin/install_plugins; true

  # INSTALL NEOVIM DEPENDENCIES
  sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen xsel ripgrep 

  ## INSTALL NVM (NODE IS COC-NVIM PLUGIN DEPENDENCY)
  if ! [ -x "$(command -v node)" ]; then
    sudo apt-get -y update
    sudo apt-get install curl
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  else
    echo 'node installed.' >&2
  fi

  # INSTALL COC-NVIM EXTENSIONS
  cd ~/.config/coc/extensions 
  npm install coc-json coc-tsserver coc-html coc-css coc-phpls coc-snippets coc-prettier --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  cd -

  # ADDITIONAL NEOVIM DEPENDENCIES
  # sudo apt-get -y install xsel ripgrep python3-dev python3-pip python3-neovim 
  # sudo npm install -g neovim

  # CLONE AND BUILD NEOVIM FROM SOURCE
  # git clone https://github.com/neovim/neovim $NEOVIM_PATH
  # cd $NEOVIM_PATH
  # make
  # sudo make install 
  # cd -

  # INSTALL VIM PLUGIN MANAGER
  # curl -fLo $VIM_PLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # vim +PlugUpdate +PlugClean! +qa, Installing vim plugins

  # INSTALL NVIM PLUGIN MANAGER
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  nvim +"PlugInstall --sync" +qa

else
  echo "Error can't install packages, only apt is supported"
  exit 1;
fi

