# Empty the trash folder that is created when you delete things as root
alias root_trash='sudo bash -c "exec rm -r /root/.local/share/Trash/{files,info}/*"'


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#ls aliases
alias ll='ls -halF'
alias la='ls -A'

# try base16 colors
alias colortest='$HOME/.config/base16-shell/./colortest'

# edit i3config file
alias i3config='$EDITOR $HOME/.i3/config' 

# edit aliases
alias aliases='$EDITOR $HOME/.bash/aliases.sh'

# edit functions
alias functions='$EDITOR $HOME/.zsh/functions.sh'

alias zshrc='$EDITOR $HOME/.zshrc'

# edit .vimrc   
alias vimrc='$EDITOR $HOME/.vimrc'

# edit .tmux.conf
alias tmuxconf='$EDITOR $HOME/.tmux.conf'

# clear screen
alias l='clear'

# refresh zsh
alias sourcezsh='source $HOME/.zshrc && cd && l'

# pwd
alias p='pwd'
alias bye='sudo shutdown -h now'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias upgrade='sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# quit 
alias q='exit'
alias :q='exit'

# start lampp server
alias lstart='sudo /opt/lampp/lampp start'

# stop lampp server
alias lstop='sudo /opt/lampp/lampp stop'

# lampp server status
alias lstatus='sudo /opt/lampp/lampp status'

# vim
alias v='vim'

# tmux
alias t='tmux'

# tmux -2
alias t2='tmux -2'

# ranger
alias r='ranger'

# cmus
alias c='cmus'

# 
alias s='php artisan serve'
alias serve='php artisan serve'

# git status
alias gs='git status'

# git log
alias gl='git log'

# git log
alias glo='git log --format=oneline'

# cd Repos
alias rp='cd $HOME/Repos'

# home
alias hm='cd $HOME'

# cd Download
alias dwl='cd $HOME/Downloads'
