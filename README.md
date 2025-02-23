### Installation

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/vhamed/dotfiles/main/bin/start_tweaking)"
```
sudo apt install ansible git -y
mkdir -p ~/Repos
cd Repos
git clone https://github.com/vhamed/dotfiles.git dotfiles
cd dotfiles
ansible-playbook -i inventory.yml playbook.yml --vault-password vault_password --become-password-file user_password
