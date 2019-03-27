log_file=~/install_progress_log.txt
DOTFILES=$HOME/Repos/dotfiles
bash $DOTFILES/install-scripts/create-symlinks.sh
bash $DOTFILES/install-scripts/install-packages.sh
vim +PluginInstall +qall
# install composer and other stuff

#==============
# Set zsh as the default shell
#==============
chsh -s ${which zsh}

#==============
# Give User summary of what happened
#==============
cat $log_file
rm $log_file

echo ' ______________'
echo ' Enjoy '$USER
echo ' --------------'
echo '        \   ^__^'
echo '         \  (oo)\_______'
echo '            (__)\       )\/\'
echo '                ||----w |'
echo '                ||     ||'
