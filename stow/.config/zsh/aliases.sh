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
alias ld='ls -ld'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

alias p='pwd'
alias l='clear'
alias g=git
alias go='git oneline'
alias gr='git remote -v'
alias bye='tmux kill-server'
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

# ranger
alias r='ranger'

# cd Repos
alias rp='cd $REPOS'

# cd Work
alias wk='cd $HOME/Work'

# cd Dotfiles
alias dotfiles='cd $DOTFILES'

# cd Downloads
alias dwl='cd $HOME/Downloads'

alias ,cc='~/.local/bin/tmux-sessionizer'

alias d='docker'
alias dc='docker compose'
