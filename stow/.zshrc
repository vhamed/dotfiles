# --- History Settings ---
HISTFILE="$HOME/.zsh_history_new"
HISTSIZE=20000          # max lines kept in memory
SAVEHIST=20000          # max lines saved to history file

# History options (use UPPERCASE consistently)
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicates when a new one is added
setopt HIST_SAVE_NO_DUPS      # Don't save duplicates to the file
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when reaching HISTSIZE
setopt SHARE_HISTORY          # Share history between sessions
setopt AUTOCD                 # Change directory by typing its name

# Ignore commands with a leading space
setopt HIST_IGNORE_SPACE

# CRITICAL: This hook makes HISTORY_IGNORE actually work
zshaddhistory() {
  emulate -L zsh
  [[ $1 != ${~HISTORY_IGNORE} ]]
}

# Key bindings for history search
bindkey '^R' history-incremental-search-backward
stty -ixon
bindkey '^S' history-incremental-search-forward
bindkey -M isearch '^J' accept-search
autoload -Uz history-search-end

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
CARGO_PATH="$HOME/.cargo/bin"

for dir in "$FNM_PATH" "$SCRIPTS_PATH" "$BIN_PATH" "$OPENCODE_PATH" "$CARGO_PATH"; do
    if [ -d "$dir" ]; then
        export PATH="$dir:$PATH"
    fi
done

if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env)"
fi
