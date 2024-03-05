#!/bin/bash

# Actualización de paquetes y herramientas
sudo yay -Syu
sudo pacman -Syu
sudo pacman -S squashfs-tools
sudo pacman -S qt5-wayland octopi ulauncher obsidian discord chrome ttf-firacode-nerd brightnessctl github-desktop-bin github-cli dracula-cursors-git
yay -S ttf-jetbrains-mono-nerd dracula-gtk-theme-git dracula-icons-git swappy
curl -sS https://starship.rs/install.sh | sudo sh

cd /usr/share/oh-my-zsh/custom/plugins/
sudo git clone https://github.com/lukechilds/zsh-nvm
sudo git clone https://github.com/zsh-users/zsh-autosuggestions

# Agregar línea a .zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
echo 'plugins=(git zsh-autosuggestions zsh-nvm)' >> ~/.zshrc

# Instalar Node.js y npm
sudo pacman -S nodejs npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts

# Instalación de Snapd
cd $HOME/Downloads/
git clone https://aur.archlinux.org/snapd.git
sudo chown -R $(whoami):$(whoami) snapd/
cd snapd/
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

cd $HOME/Documents/GitHub/.config-arcolinux/
rm -rf ~/.config/hypr/
cp -f .config-arcolinux/* ~/.config/

# Reiniciar el sistema
sudo reboot


