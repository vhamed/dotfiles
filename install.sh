#!/usr/bin/env bash

export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function doIt() {
  for file in $DOTFILES/bin/{packages,symlink,zsh,tmux,vim}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
  done;
  unset file;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
