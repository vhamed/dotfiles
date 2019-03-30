log_file=~/install_progress_log.txt
bash ~/Repos/dotfiles/install-scripts/create-symlinks.sh
bash ~/Repos/dotfiles/install-scripts/install-packages.sh
bash ~/Repos/dotfiles/install-scripts/install-web-development-tools.sh
bash ~/Repos/dotfiles/install-scripts/install-vim-plugins.sh

#==============
# Set ZSH as the default shell
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
echo '                ||     ||'
echo '                ||     ||'
echo '                         '
