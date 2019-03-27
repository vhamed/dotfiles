#============
# zsh 
#============
sudo apt-get -y install zsh
echo "installing zsh ..."
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

#============
# vim 
#============
sudo apt-get -y install vim
echo "installing vim ..."
if type -p vim > /dev/null; then
    echo "Vim Installed" >> $log_file
else
    echo "Vim FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Vundle-Vim 
#============
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Vim-Vundle Installed ..." >> $log_file

#============
# keepassx 
#============
sudo apt-get -y install keepassx
echo "installing keepassx ..."
if type -p keepassx > /dev/null; then
    echo "Keepassx Installed" >> $log_file
else
    echo "Keepassx FAILED TO INSTALL!!!" >> $log_file
fi


#============
# figlet 
#============
sudo apt-get -y install figlet
echo "installing figlet ..."
if type -p figlet > /dev/null; then
    echo "figlet Installed" >> $log_file
else
    echo "figlet FAILED TO INSTALL!!!" >> $log_file
fi

#============
# cowsay 
#============
sudo apt-get -y install cowsay
echo "installing cowsay ..."
if type -p cowsay > /dev/null; then
    echo "cowsay Installed" >> $log_file
else
    echo "cowsay FAILED TO INSTALL!!!" >> $log_file
fi

#============
# rofi 
#============
sudo apt-get -y install rofi
echo "installing rofi ..."
if type -p rofi > /dev/null; then
    echo "rofi Installed" >> $log_file
else
    echo "rofi FAILED TO INSTALL!!!" >> $log_file
fi

#============
# curl 
#============
sudo apt-get -y install curl
echo "installing curl ..."
if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "crul FAILED TO INSTALL!!!" >> $log_file
fi

#============
# tmux 
#============
sudo apt-get -y install tmux
echo "installing tmux ..."
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Tmux: Tmux-Plugin-Manager 
#============
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "tmux-Plugin-Manager Installed" >> $log_file

#============
# cmus 
#============
sudo apt-get -y install cmus
echo "installing cmus ..."
if type -p tmux > /dev/null; then
    echo "cmus Installed" >> $log_file
else
    echo "cmus FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Zsh: base16-shell 
#============
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
echo "Base16-shell Installed ..." >> $log_file

#============
# Zsh: zsh-autosuggestions 
#============
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "Zsh-authsuggestions plugin installed ... " >> $log_file

#============
# Vim: youcompleteme vim-plugin dependencies 
#============
sudo apt-get -y install build-essential cmake
sudo apt-get -y install python-dev python3-dev
echo "youcomplete vim-plugin dependencies Installed ..." >> $log_file
