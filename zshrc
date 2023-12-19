# Set up the prompt
setopt histignorealldups sharehistory autocd
HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)"

# Use vi keybindings
bindkey -v

# Use modern completion system
autoload -Uz compinit
compinit

autoload -U colors
colors

# zsh-autosuggestions plugin
# source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#696969"
bindkey '^ ' autosuggest-accept

typeset -ga sources
sources+="$HOME/.config/zsh/exports.sh"
sources+="$HOME/.secrets"
# sources+="$HOME/.config/zsh/prompt.sh"
sources+="$HOME/.config/zsh/wincent_prompt.sh"
sources+="$HOME/.config/zsh/aliases.sh"
sources+="$HOME/.config/zsh/functions.sh"

foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end

# fnm
export PATH="/home/hamed/.local/share/fnm:$PATH"
eval "`fnm env`"
