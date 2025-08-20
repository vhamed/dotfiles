# =============================================
# Ansible Commands (Secure & Maintainable)
# =============================================
# Usage: `just <command> [ARGS]`
# Example: `just ping --ask-vault-pass`

# --- Variables ---
INVENTORY := "inventory.yml"
VAULT_FILE := "vars/vault.yml"
PLAYBOOK_DIR := "playbooks"

# --- Targets ---

# Ping localhost (test connectivity)
ping:
  ansible -i {{INVENTORY}} \
    -e @"{{VAULT_FILE}}" \
    -m ping localhost

# Setup dotfiles
tweak *ARGS:
  ansible-playbook -i {{INVENTORY}} \
    {{PLAYBOOK_DIR}}/main.yml \
    {{ARGS}}

# Create symlinks
stow:
  ls ~/Repos/dotfiles/stow | xargs stow --dotfiles -d ~/Repos/dotfiles/stow -t ~ 

# Install tmux plugins
tmux-plugins:
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

