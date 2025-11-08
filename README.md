# Dotfiles Setup Guide

![nvim-screenshot](https://i.imgur.com/3LxJbjX.png)

This repository contains my personal dotfiles and setup scripts for automating system configuration using **Ansible**.

## Prerequisites

Before proceeding, ensure you have:
- **`curl`** (to fetch the installation script)

### Install Dependencies

#### On Arch Linux:

```bash
sudo pacman -S curl stow
```

#### On Debian/Ubuntu:

```bash
sudo apt update
sudo apt install curl stow
```

### 🔐 Setup Vault & User Passwords

For security, store your Ansible Vault and user passwords in encrypted files:
```bash
echo "your_vault_password" > ~/.vault_password  # Used for Ansible Vault
echo "your_user_password" > ~/.user_password    # Used for sudo/authentication
````

#### Security Note:

Restrict permissions to these files:
```bash
chmod 600 ~/.vault_password ~/.user_password
```

## 🚀 Installation

Run the automated setup script:
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/vhamed/dotfiles/ansible/bin/start_tweaking)"
```

## 🔗 Symlink Dotfiles with Stow

cd into repo
```bash
stow -d ~/Repos/dotfiles/stow -t ~ .
```

## Install tmux plugins

cd into repo
```bash
tmux start-server && tmux new-session -d && sleep 1 && ~/.tmux/plugins/tpm/scripts/install_plugins.sh && tmux kill-server
```

# 📜 License

MIT © Hamed
