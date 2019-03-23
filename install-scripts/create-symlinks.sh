# !/bin/zsh
#==============
# Variables
#==============
dotfiles_dir=~/dotfiles
log_file=~/install_progress_log.txt

#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.bash > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.fonts > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $dotfiles_dir/zsh ~/.zsh
ln -sf $dotfiles_dir/zshrc ~/.zshrc
ln -sf $dotfiles_dir/tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/vimrc ~/.vimrc
ln -sf $dotfiles_dir/fonts ~/.fonts
ln -sf $dotfiles_dir/UltiSnips ~/.vim/UltiSnips
ln -sf $dotfiles_dir/dir_colors ~/.dir_colors

echo "creating symlinks of :  " >> $log_file
echo "bashrc " >> $log_file
echo "zshrc " >> $log_file
echo "tmux.conf " >> $log_file
echo "vimrc " >> $log_file
echo "fonts " >> $log_file
echo "dir_colors " >> $log_file

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file

echo ' ______________'
echo ' < Enjoy >'
echo ' --------------'
echo '        \   ^__^'
echo '         \  (oo)\_______'
echo '            (__)\       )\/\'
echo '                ||----w |'
echo '                ||     ||'

rm $log_file
