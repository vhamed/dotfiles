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
source ~/.config/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
