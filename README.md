# Hi, This is my arcolinux hyprland dots.
### Update yay and pacman.
```sh
sudo yay -Syu
sudo pacman -Syu

# Squashfs-tools: Tools for working with SquashFS file systems
sudo pacman -S squashfs-tools

```
### Install snapcraft
```sh
# Clone snapd from AUR and compile
# Snapd: Universal package manager for Linux distributions

cd Downloads/
git clone https://aur.archlinux.org/snapd.git
sudo chown -R raz:raz snapd/
cd snapd/
makepkg -si

# Enable and configure snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
 
# Install snap applications
# Code: Microsoft's source code editor
# GitKraken: Graphical interface for Git
# Postman: Platform for testing and developing APIs

sudo snap install code --classic
sudo snap install gitkraken --classic
sudo snap install postman
```
### Install octopi
```sh
sudo pacman -S octopi
sudo pacman -S qt5-wayland
```
#### apps:
ulauncher, obsidian, discord, chrome, ttf-firacode-nerd,
brightnessctl, virtualbox, virt-manager

### Yay packages
```sh
yay -S ttf-jetbrains-mono-nerd dracula-gtk-theme-git dracula-icons-git swappy
```



### Starship
from octopi install Fira Code Font Text, then install starship
https://starship.rs/

```sh
curl -sS https://starship.rs/install.sh | sh
```
Afther that, you have to add this line in the .zshrc

```sh
# ~/.zshrc
eval "$(starship init zsh)"
```

### ZSH plugins

Clone this repository into /usr/share/oh-my-zsh/custom/plugins

```sh
cd /usr/share/oh-my-zsh/custom/plugins/
```
    
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions
```

Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):
```sh
plugins=( 
    git
    zsh-autosuggestions
)
```

Start a new terminal session.

### Install NodeJS, nvm
https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script
```sh
pacman -S nodejs npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
```

### Finally you can clone this repo and replace the .config

## New, use setup script.

```sh
mkdir ~/Documents/GitHub/
cd ~/Documents/GitHub/
git clone https://github.com/GodDoesNotPlayDice/.config-arcolinux.git
cd .config-arcolinux/
sudo chmod +x setup.sh
./setup.sh





```