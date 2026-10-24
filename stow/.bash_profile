# Placeholder file, loads .bashrc in the home directory.
# This fixes the problem with bash as a login shell.

if [ ! -z $TMUX ]; then
  source ~/.bashrc
fi
