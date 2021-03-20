export EDITOR="nvim";
export REPOS=$HOME/Repos;
export DOTFILES=$REPOS/dotfiles;

export HISTSIZE=1000
export HISTFILESIZE=2000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd *:cd:cd ~:l:pwd:exit:date:* --help";

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
