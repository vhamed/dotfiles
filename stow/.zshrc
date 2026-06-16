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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#696969"
bindkey '^ ' autosuggest-accept

typeset -ga sources
sources+="$HOME/.config/zsh/exports.sh"
sources+="$HOME/.secrets"
sources+="$HOME/.config/zsh/wincent_prompt.sh"
sources+="$HOME/.config/zsh/aliases.sh"
sources+="$HOME/.config/zsh/functions.sh"

foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end

SCRIPTS_PATH="$HOME/scripts"
BIN_PATH="$HOME/.local/bin"
FNM_PATH="$HOME/.local/share/fnm"
OPENCODE_PATH="$HOME/.opencode/bin"

for dir in "$FNM_PATH" "$SCRIPTS_PATH" "$BIN_PATH" "$OPENCODE_PATH"; do
    if [ -d "$dir" ]; then
        export PATH="$dir:$PATH"
    fi
done

if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env)"
fi
