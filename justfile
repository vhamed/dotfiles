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

list:
  just --list

lint:
  ansible-inventory -i {{INVENTORY}} --list
