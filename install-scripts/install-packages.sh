log_file=~/install_progress_log.txt

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
# base16-shell 
#============
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
echo "Base16-shell Installed ..." >> $log_file

#============
# youcompleteme vim-plugin dependencies 
#============
sudo apt-get -y install build-essential cmake
sudo apt-get -y install python-dev python3-dev
echo "youcomplete vim-plugin dependencies Installed ..." >> $log_file

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo 'Enjoy - '$USERNAME
rm $log_file
