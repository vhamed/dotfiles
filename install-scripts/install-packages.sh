#============
# Curl 
#============
sudo apt-get -y install curl
echo "installing curl ..."
if type -p curl > /dev/null; then
    echo "CURL Installed" >> $log_file
else
    echo "CURL FAILED TO INSTALL!!!" >> $log_file
fi

#============
# SSH 
#============
sudo apt-get -y install openssh-server
echo "installing SSH ..."
if type -p ssh > /dev/null; then
    echo "SSH-Server Installed" >> $log_file
else
    echo "SSH-Server FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Zsh 
#============
sudo apt-get -y install zsh
echo "installing zsh ..."
if type -p zsh > /dev/null; then
    echo "ZSH Installed" >> $log_file
else
    echo "ZSH FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Zsh-plugins: base16-shell 
#============
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
echo "Base16-shell Installed ..." >> $log_file

#============
# Zsh-plugins: zsh-autosuggestions 
#============
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "Zsh-authsuggestions installed ... " >> $log_file

#============
# Tmux 
#============
sudo apt-get -y install tmux
echo "installing tmux ..."
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Tmux-plugins: tmux-plugin-manager 
#============
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "tmux-Plugin-Manager Installed" >> $log_file

#============
# Vim 
#============
sudo apt-get -y install vim
echo "installing vim ..."
if type -p vim > /dev/null; then
    echo "VIM Installed" >> $log_file
else
    echo "VIM FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Keepassx 
#============
sudo apt-get -y install keepassx
echo "installing keepassx ..."
if type -p keepassx > /dev/null; then
    echo "Keepassx Installed" >> $log_file
else
    echo "Keepassx FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Figlet 
#============
sudo apt-get -y install figlet
echo "installing figlet ..."
if type -p figlet > /dev/null; then
    echo "figlet Installed" >> $log_file
else
    echo "figlet FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Cowsay 
#============
sudo apt-get -y install cowsay
echo "installing cowsay ..."
if type -p cowsay > /dev/null; then
    echo "cowsay Installed" >> $log_file
else
    echo "cowsay FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Rofi 
#============
sudo apt-get -y install rofi
echo "installing rofi ..."
if type -p rofi > /dev/null; then
    echo "rofi Installed" >> $log_file
else
    echo "rofi FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Cmus 
#============
sudo apt-get -y install cmus
echo "installing cmus ..."
if type -p tmux > /dev/null; then
    echo "cmus Installed" >> $log_file
else
    echo "cmus FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Konsole 
#============
sudo apt-get -y install konsole
echo "installing konsole ..."
if type -p tmux > /dev/null; then
    echo "konsole Installed" >> $log_file
else
    echo "konsole FAILED TO INSTALL!!!" >> $log_file
fi

#============
# Snap 
#============
sudo apt-get -y install snapd
echo "installing snap ..."
if type -p tmux > /dev/null; then
    echo "snap Installed" >> $log_file
else
    echo "snap FAILED TO INSTALL!!!" >> $log_file
fi
