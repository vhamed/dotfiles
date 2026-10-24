# UPPERCASE consistently

# Max lines saved to history file
HISTSIZE=20000          
SAVEHIST=20000
# Remove older duplicates when a new one is added
setopt HIST_IGNORE_ALL_DUPS   
# Don't save duplicates to the file
setopt HIST_SAVE_NO_DUPS      
# Expire duplicates first when reaching HISTSIZE
setopt HIST_EXPIRE_DUPS_FIRST 
# Share history between sessions
setopt SHARE_HISTORY          
# Ignore commands with a leading space
setopt HIST_IGNORE_SPACE      
# CRITICAL: This hook makes HISTORY_IGNORE actually work
zshaddhistory() {
  emulate -L zsh
  [[ $1 != ${~HISTORY_IGNORE} ]]
}

# Change directory by typing its name
setopt AUTOCD                 

# Expansion and Globbing
set -o markdirs
set -o nomatch
setopt NULL_GLOB

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=long 

autoload -U colors
colors

source $XDG_CONFIG_HOME/sh/alias
source $XDG_CONFIG_HOME/zsh/wincent_prompt
source $XDG_CONFIG_HOME/zsh/keybindings
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Private, untracked overrides
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/sh/.sh-private" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/sh/.sh-private"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc-private" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc-private"

if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env)"
fi
