#!/bin/bash

set -e  # Esto hace que el script se detenga si ocurre un error

echo "Actualizando e instalando paquetes..."
sudo pacman -Syu --noconfirm
sudo yay -Syu --noconfirm

sudo pacman -S squashfs-tools qt5-wayland octopi ulauncher obsidian discord ttf-firacode-nerd brightnessctl github-desktop-bin github-cli dracula-cursors-git snapd snapd-glib --noconfirm

yay -S ttf-jetbrains-mono-nerd dracula-gtk-theme-git dracula-icons-git swappy snapd --noconfirm

echo "Instalando Starship..."
curl -sS https://starship.rs/install.sh | sudo sh

echo "Instalando plugins de Zsh..."
cd /usr/share/oh-my-zsh/custom/plugins/
sudo git clone https://github.com/lukechilds/zsh-nvm
sudo git clone https://github.com/zsh-users/zsh-autosuggestions

echo "Instalando Node.js y NVM..."
sudo pacman -S nodejs npm --noconfirm

echo "Habilitando snapd"
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap


echo "Copiando configuraciones..."
rm -rf ~/.config/hypr/
rm -rf ~/.zshrc
cp -rf ~/Documents/GitHub/.config-arcolinux/.zshrc ~/
cp -rf ~/Documents/GitHub/.config-arcolinux/* ~/.config/

echo "Warning: Los paquetes de snap pueden fallar, si pasa intentar denuevo despues del reboot."
read -p "¿Desea instalar los paquetes de Snapd? (Y/N): " snap_confirmation
if [[ "$snap_confirmation" == [yY] || "$snap_confirmation" == [yY][eE][sS] ]]; then
    sudo snap install code --classic
    sudo snap install gitkraken --classic
    sudo snap install postman
else
    echo "No se instalarán los paquetes de Snapd."
fi


# Preguntar al usuario antes de reiniciar
read -p "Todos los pasos se completaron correctamente. ¿Desea reiniciar el sistema ahora? (Y/N): " confirmacion
if [[ "$confirmacion" == [yY] || "$confirmacion" == [yY][eE][sS] ]]; then
    echo "Reiniciando el sistema..."
    sudo reboot
else
    echo "No se reiniciará el sistema."
fi
