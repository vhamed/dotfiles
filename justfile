# =============================================
# Ansible Commands (Secure & Maintainable)
# =============================================
# Usage: `just <command> [ARGS]`
# Example: `just ping --ask-vault-pass`

# --- Variables ---
VAULT_FILE := "vars/vault.yml"

# Create symlinks
stow:
  ls ~/Repos/dotfiles/stow | xargs stow --dotfiles -d ~/Repos/dotfiles/stow -t ~ 

# Install tmux plugins
install-tmux-plugins:
  tmux start-server  
  tmux new-session -d 
  sleep 1 
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh 
  tmux kill-server

# List all available commands
ls:
  just --list

list:
  just --list

