#!/usr/bin/env bash

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

APT_GET_CMD=$(which apt-get)
NEOVIM_PATH=~/Repos/neovim 

if [[ ! -z $APT_GET_CMD ]]; then
  sudo apt install -y git tmux zsh vim curl
  # I3 DEPENDENCIES, i3 4.22 is required in order to use gap, to install it change /etc/sour... to jammy
  sudo apt install -y kitty rofi i3 polybar feh 
  # NEOVIM DEPENDENCIES
  sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip doxygen xsel ripgrep python3-dev python3-pip python3-neovim 

  # Download wallpaper
  curl https://i.imgur.com/uWXlR5g.jpg > ~/Pictures/peakpx1.jpg

  # INSTALL TMUX PLUGIN MANAGER (TPM)
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # INSTALL ZSH plugin (zsh-autosuggestions)
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh-plugins/zsh-autosuggestions

  # INSTALL ZSH plugin (zsh-syntax-highlighting)
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/zsh-plugins/zsh-syntax-highlighting

  # INSTALL ZSH plugin (zsh-history-substring-search)
  git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh-plugins/zsh-history-substring-search

  # INSTALL TMUX PLUGINS
  tmux new -s install-plugins-session '~/.tmux/plugins/tpm/bin/install_plugins'


  ## INSTALL NVM (NODE IS COC-NVIM PLUGIN DEPENDENCY)
  if ! [ -x "$(command -v node)" ]; then
    sudo apt-get -y update
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    nvm install --lts
    nvm use --lts
  else
    echo 'node installed.' >&2
  fi

  # INSTALL COC-NVIM EXTENSIONS
  cd ~/.config/coc/extensions 
  npm install coc-json coc-tsserver coc-html coc-css coc-phpls coc-snippets coc-prettier --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
  sudo npm install -g neovim
  cd -

  # CLONE AND BUILD NEOVIM FROM SOURCE
  git clone https://github.com/neovim/neovim $NEOVIM_PATH
  cd $NEOVIM_PATH
  make
  sudo make install 
  cd -

  # install FiraCode Font
  curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip --output ~/Downloads/FiraCode.zip
  unzip ~/Downloads/FiraCode.zip -d ~/Downloads/FiraCode
  cp ~/Downloads/FiraCode/* ~/.local/share/fonts/
  sudo fc-cache -fv

  # INSTALL VIM PLUGIN MANAGER
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugUpdate +PlugClean! +qa

  # INSTALL NVIM PLUGIN MANAGER
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  nvim +"PlugInstall --sync" +qa

else
  echo "Error can't install packages, only apt is supported"
  exit 1;
fi

