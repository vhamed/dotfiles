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

# Get week number
alias week='date +%V'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# edit aliases
alias aliases='$EDITOR $HOME/config/zsh/aliases.sh'
alias functions='$EDITOR $HOME/.config/zsh/functions.sh'
alias zshrc='$EDITOR $HOME/.zshrc'
alias vimrc='$EDITOR $HOME/.vimrc'
alias tmuxconf='$EDITOR $HOME/.tmux.conf'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# pwd
alias p='pwd'
alias l='clear'
alias bye='tmux kill-server'
alias leave='poweroff'
alias update='sudo apt -y update && sudo apt -y upgrade'
alias upgrade='sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# quit 
alias q='exit'
alias :q='exit'
alias :qa='exit'

# vim
alias v='nvim'

# tmux
alias t='tmux'

# tmux -2
alias t2='tmux -2'

# home
alias hm='cd $HOME'

# cd Repos
alias rp='cd $REPOS'

# cd Music
alias music='cd $MUSIC'

# cd Dotfiles
alias dotfiles='cd $DOTFILES'

# cd Downloads
alias dwl='cd $HOME/Downloads'
