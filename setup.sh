#!/bin/bash

set -e  # Esto hace que el script se detenga si ocurre un error

# Variables
DOWNLOADS_DIR="$HOME/Downloads"
GITHUB_DIR="$HOME/Documents/GitHub"

# Actualizar e instalar paquetes
sudo pacman -Syu --noconfirm
sudo pacman -S squashfs-tools qt5-wayland octopi ulauncher obsidian discord ttf-firacode-nerd brightnessctl github-desktop-bin github-cli dracula-cursors-git --noconfirm

yay -S ttf-jetbrains-mono-nerd dracula-gtk-theme-git dracula-icons-git swappy --noconfirm

# Instalar Starship
curl -sS https://starship.rs/install.sh | sudo sh

# Instalar plugins de Zsh
cd /usr/share/oh-my-zsh/custom/plugins/
sudo git clone https://github.com/lukechilds/zsh-nvm
sudo git clone https://github.com/zsh-users/zsh-autosuggestions

# Configurar Zsh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
echo 'plugins=(git zsh-autosuggestions zsh-nvm)' >> ~/.zshrc
sed -i '/^ZSH_THEME="random"$/d' ~/.zshrc

# Instalar Node.js y NVM
sudo pacman -S nodejs npm --noconfirm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc  # Cargar configuración de Zsh
nvm install --lts

# Instalar Snapd
cd "$DOWNLOADS_DIR"
git clone https://aur.archlinux.org/snapd.git
sudo chown -R $(whoami):$(whoami) snapd/
cd snapd/
makepkg -si --noconfirm
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# Copiar configuraciones
rm -rf ~/.config/hypr/
cp -rf "$GITHUB_DIR/.config-arcolinux/" ~/.config/

# Reiniciar el sistema
sudo reboot
