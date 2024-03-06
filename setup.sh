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

# Instalar Node.js y NVM
sudo pacman -S nodejs npm --noconfirm
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
# echo 'export NVM_DIR=~/.nvm' >> ~/.zshrc
# echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ~/.zshrc

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
cp -rf ~/Documents/GitHub/.config-arcolinux/* ~/.config/

# Preguntar al usuario antes de reiniciar
read -p "Todos los pasos se completaron correctamente. ¿Desea reiniciar el sistema ahora? (Y/N): " confirmacion
if [[ "$confirmacion" == [yY] || "$confirmacion" == [yY][eE][sS] ]]; then
    sudo reboot
else
    echo "No se reiniciará el sistema."
fi
