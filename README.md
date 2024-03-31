# Arcolinux hyprland dots.
*arcolinuxb-hyprland-v24.02.04-x86_64.iso*

## Automatic

```sh
mkdir ~/Documents/GitHub/
cd ~/Documents/GitHub/
git clone https://github.com/GodDoesNotPlayDice/.config-arcolinux.git
cd .config-arcolinux/
sudo chmod +x setup.sh
./setup.sh
```

## Manual


### Update yay and pacman.
```sh
sudo yay -Syu
sudo pacman -Syu
```

### Install pacman packages
```sh
sudo pacman -S squashfs-tools qt5-wayland octopi ulauncher obsidian discord ttf-firacode-nerd brightnessctl github-desktop-bin github-cli dracula-cursors-git nodejs npm snapd snapd-glib nomachine libreoffice-still-es google-chrome gitkraken
```

### Yay packages
```sh
yay -S ttf-jetbrains-mono-nerd dracula-gtk-theme-git dracula-icons-git swappy snapd postman-bin visual-studio-code-bin
```

### Starship

```sh
curl -sS https://starship.rs/install.sh | sh
```

### ZSH plugins

Clone this repository into /usr/share/oh-my-zsh/custom/plugins

```sh
cd /usr/share/oh-my-zsh/custom/plugins/
```
    
```sh
sudo git clone https://github.com/zsh-users/zsh-autosuggestions

sudo git clone https://github.com/lukechilds/zsh-nvm
```

### Config snap config and install packages
```sh
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sudo snap install code --classic
sudo snap install gitkraken --classic
sudo snap install postman
```
### Fix the waybar package
```sh
sudo yay -R waybar-hyprland-git
sudo pacman -S waybar
```
### Replace files
```sh
sudo rm -rf ~/.config/hypr/
sudo rm -rf ~/.zshrc
sudo cp -rf ~/Documents/GitHub/.config-arcolinux/.zshrc ~/
sudo cp -rf ~/Documents/GitHub/.config-arcolinux/* ~/.config/
```

*Replace into .config (hypr, gtk-3.0, ulauncher, waybar, alacritty) in the $HOME replace .zshrc*


![image](https://github.com/GodDoesNotPlayDice/.config-arcolinux/assets/104604407/cf221090-6d48-4c27-9324-4b02f997b54a)



