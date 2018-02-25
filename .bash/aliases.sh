# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#ls aliases
alias ll='ls -halF'
alias la='ls -A'

alias colortest='$HOME/.config/base16-shell/./colortest'

# edit i3config file
alias i3config='vim $HOME/.i3/config' 

# edit aliases
alias aliases='vim $HOME/.bash/aliases.sh'

# edit exports
alias exports='vim $HOME/.bash/exports.sh'

# edit functions
alias functions='vim $HOME/.bash/functions.sh'

# edit .bashrc 
alias bashrc='vim $HOME/.bashrc'

# edit .muttrc
alias muttrc='vim $HOME/.muttrc'

# edit .vimrc   
alias vimrc='$EDITOR $HOME/.vimrc'

# edit .tmux.conf
alias tmuxconf='vim $HOME/.tmux.conf'

# show bumblebee-status modules options
alias bumblebeemodules='cd $HOME/bumblebee-status && ./bumblebee-status -l modules | less && cd -'

# show bumblebee-status themes
alias bumblebeethemes='cd $HOME/bumblebee-status && ./bumblebee-status -l themes | less && cd -'

# mocp config file
alias mocpconf='v $HOME/.moc/config'

# mocp keymap file
alias mocpkeymap='v $HOME/.moc/keymap'

# g++ compiler plus opencv (I called it occ :) )
# occ(){
#     g++ $1 $(pkg-config --libs opencv)
# }

# clear screen
alias l='clear'

# refresh bash
alias sourcebash='source $HOME/.bashrc && cd && l'

# pwd
alias p='pwd'

# cd ..
alias ..='cd ..'

# cd ../..
alias ....='cd ../..'

# ranger
alias r='ranger'

# quit 
alias q='exit'

# home
alias home='cd $HOME'

# vim
alias v='vim'

# tmux
alias tmux='tmux -2'

# tmux
alias t='tmux -2'

# cd Repos
alias repos='cd $HOME/Repos'

# cd php repos
alias prepos='cd $HOME/Repos/Php'

# cd Dotfiles
alias dotfiles='cd $HOME/Repos/Dotfiles'

# cd Download
alias dwl='cd $HOME/Downloads'

# cd Music
alias music='cd $HOME/Music'

alias occrepos='cd $REPOS"/Opencv_pgm"'

# start lampp server
alias lstart='sudo /opt/lampp/lampp start'

# stop lampp server
alias lstop='sudo /opt/lampp/lampp stop'

# lampp server status
alias lstatus='sudo /opt/lampp/lampp status'

# shutdown right now
alias shutd='shutdown +0'

# Change Themes by typing theme's name
# alias 3024='base16_3024'
# alias apathy='base16_apathy'
# alias ashes='base16_ashes'
# alias atelier-cave-light='base16_atelier-cave-light'
# alias atelier-cave='base16_atelier-cave'
# alias atelier-dune-light='base16_atelier-dune-light'
# alias atelier-dune='base16_atelier-dune'
# alias atelier-estuary-light='base16_atelier-estuary-light'
# alias atelier-estuary='base16_atelier-estuary'
# alias atelier-forest-light='base16_atelier-forest-light'
# alias atelier-forest='base16_atelier-forest'
# alias atelier-heath-light='base16_atelier-heath-light'
# alias atelier-heath='base16_atelier-heath'
# alias atelier-lakeside-light='base16_atelier-lakeside-light'
# alias atelier-lakeside='base16_atelier-lakeside'
# alias atelier-plateau-light='base16_atelier-plateau-light'
# alias atelier-plateau='base16_atelier-plateau'
# alias atelier-savanna-light='base16_atelier-savanna-light'
# alias atelier-savanna='base16_atelier-savanna'
# alias atelier-seaside-light='base16_atelier-seaside-light'
# alias atelier-seaside='base16_atelier-seaside'
# alias atelier-sulphurpool-light='base16_atelier-sulphurpool-light'
# alias atelier-sulphurpool='base16_atelier-sulphurpool'
# alias bespin='base16_bespin'
# alias brewer='base16_brewer'
# alias bright='base16_bright'
# alias brushtrees-dark='base16_brushtrees-dark'
# alias brushtrees='base16_brushtrees'
# alias chalk='base16_chalk'
# alias circus='base16_circus'
# alias classic-dark='base16_classic-dark'
# alias classic-light='base16_classic-light'
# alias codeschool='base16_codeschool'
# alias cupcake='base16_cupcake'
# alias cupertino='base16_cupertino'
# alias darktooth='base16_darktooth'
# alias default-dark-gnome='base16_default-dark-gnome'
# alias default-dark='base16_default-dark'
# alias default-light='base16_default-light'
# alias dracula='base16_dracula'
# alias eighties='base16_eighties'
# alias embers='base16_embers'
# alias flat='base16_flat'
# alias github='base16_github'
# alias google-dark='base16_google-dark'
# alias google-light='base16_google-light'
# alias grayscale-dark='base16_grayscale-dark'
# alias grayscale-light='base16_grayscale-light'
# alias greenscreen='base16_greenscreen'
# alias gruvbox-dark-hard='base16_gruvbox-dark-hard'
# alias gruvbox-dark-medium='base16_gruvbox-dark-medium'
# alias gruvbox-dark-pale='base16_gruvbox-dark-pale'
# alias gruvbox-dark-soft='base16_gruvbox-dark-soft'
# alias gruvbox-light-hard='base16_gruvbox-light-hard'
# alias gruvbox-light-medium='base16_gruvbox-light-medium'
# alias gruvbox-light-soft='base16_gruvbox-light-soft'
# alias harmonic-dark='base16_harmonic-dark'
# alias harmonic-light='base16_harmonic-light'
# alias hopscotch='base16_hopscotch'
# alias irblack='base16_irblack'
# alias isotope='base16_isotope'
# alias macintosh='base16_macintosh'
# alias marrakesh='base16_marrakesh'
# alias material-darker='base16_material-darker'
# alias material-lighter='base16_material-lighter'
# alias material-palenight='base16_material-palenight'
# alias material='base16_material'
# alias materia='base16_materia'
# alias mellow-purple='base16_mellow-purple'
# alias mexico-light='base16_mexico-light'
# alias mocha='base16_mocha'
# alias monokai='base16_monokai'
# alias nord='base16_nord'
# alias oceanicnext='base16_oceanicnext'
# alias ocean='base16_ocean'
# alias onedark='base16_onedark'
# alias one-light='base16_one-light'
# alias paraiso='base16_paraiso'
# alias phd='base16_phd'
# alias pico='base16_pico'
# alias pop='base16_pop'
# alias porple='base16_porple'
# alias railscasts='base16_railscasts'
# alias rebecca='base16_rebecca'
# alias seti='base16_seti'
# alias shapeshifter='base16_shapeshifter'
# alias solarflare='base16_solarflare'
# alias solarized-dark='base16_solarized-dark'
# alias solarized-light='base16_solarized-light'
# alias spacemacs='base16_spacemacs'
# alias summerfruit-dark='base16_summerfruit-dark'
# alias summerfruit-light='base16_summerfruit-light'
# alias tomorrow-night='base16_tomorrow-night'
# alias tomorrow='base16_tomorrow'
# alias tube='base16_tube'
# alias twilight='base16_twilight'
# alias unikitty='base16_unikitty'
# alias unikitty-light='base16_unikitty-light'
# alias woodland='base16_woodland'
# alias xcode-dusk='base16_xcode-dusk'
# alias zenburn='base16_zenburn'
