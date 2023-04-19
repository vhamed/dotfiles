DOTFILES_PATH=~/Repos/dotfiles
echo Do you want to config git \(Y\/y\)
read ANSWER

if [[ "$ANSWER" == "Y" || "$ANSWER" == "y" ]]; then
  echo Enter your name
  read NAME 

  echo Enter your email
  read EMAIL 
  echo -e "[include] 
    path = ${DOTFILES_PATH}/gitconfig
[user]
    name = ${NAME}
    email = ${EMAIL}" > ~/.gitconfig
else
  echo "Skip git config"
fi
