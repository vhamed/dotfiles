# !/bin/zsh
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
mkdir -p $HOME/.zsh
ln -sf $DOTFILES/zsh/aliases.sh ~/.zsh/aliases.sh
ln -sf $DOTFILES/zsh/functions.sh ~/.zsh/functions.sh
ln -sf $DOTFILES/zshrc ~/.zshrc
ln -sf $DOTFILES/tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/vimrc ~/.vimrc
ln -sf $DOTFILES/fonts ~/.fonts
ln -sf $DOTFILES/UltiSnips ~/.vim/UltiSnips
ln -sf $DOTFILES/dir_colors ~/.dir_colors

echo "creating symlinks of :  " >> $log_file
echo "bashrc " >> $log_file
echo "zshrc " >> $log_file
echo "tmux.conf " >> $log_file
echo "vimrc " >> $log_file
echo "fonts " >> $log_file
echo "dir_colors " >> $log_file
