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

ping:
  ansible -i {{INVENTORY}} \
    -e @"{{VAULT_FILE}}" \
    -m ping localhost
    

tweak:
  ansible-playbook -i {{INVENTORY}} \
    {{PLAYBOOK_DIR}}/main.yml \

stow:
  ls ~/Repos/dotfiles/stow | xargs stow --dotfiles -d ~/Repos/dotfiles/stow -t ~ 

tmux-plugins:
  tmux start-server  
  tmux new-session -d 
  sleep 1 
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh 
  tmux kill-server

list:
  just --list

