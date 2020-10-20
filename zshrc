# Set up the prompt
setopt histignorealldups sharehistory autocd

# Use vi keybindings
bindkey -v

# Use modern completion system
autoload -Uz compinit
compinit

autoload -U colors
colors

# zsh-autosuggestions plugin
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

typeset -ga sources
sources+="$HOME/.config/zsh/exports.sh"
sources+="$HOME/.extra"
sources+="$HOME/.config/zsh/prompt.sh"
sources+="$HOME/.config/zsh/aliases.sh"
sources+="$HOME/.config/zsh/functions.sh"

foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end
