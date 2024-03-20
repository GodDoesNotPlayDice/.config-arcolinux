#!/bin/bash

# Function to check the result of each command
check_result() {
    if [ $? -ne 0 ]; then
        echo "Error occurred: $1"
        exit 1
    fi
}

check_directory() {
    if [ -d "$1" ]; then
        echo "Directory '$1' already exists."
    else
        echo "Directory '$1' created successfully."
    fi
}

# Attempt to create directories

# mkdir -p ~/Documents/GitHub/.config-arcolinux/hypr/
# check_directory ~/Documents/GitHub/.config-arcolinux/hypr/

# Backup configurations


cp -r ~/.config/hypr/ ~/Documents/GitHub/.config-arcolinux/
check_result "Failed to backup hypr/"

cp -r ~/.config/alacritty/ ~/Documents/GitHub/.config-arcolinux
check_result "Failed to backup alacritty/"

cp -r ~/.config/waybar/ ~/Documents/GitHub/.config-arcolinux
check_result "Failed to backup waybar"

cp -r ~/.config/neofetch/ ~/Documents/GitHub/.config-arcolinux
check_result "Failed to backup neofetch/"

cp -r ~/.config/ulauncher/ ~/Documents/GitHub/.config-arcolinux
check_result "Failed to backup ulauncher/"

cp -rf ~/.zshrc ~/Documents/GitHub/.config-arcolinux
check_result "Failed to backup .zshrc file"

cp -rf ~/.config/gtk-3.0/ ~/Documents/GitHub/.config-arcolinux
check_result "Failed to backup gtk-3.0" 

cp -rf ~/.config/setup.sh ~/Documents/GitHub/.config-arcolinux
check_result "Failed setup.sh"

cp -rf ~/.config/backup.sh ~/Documents/GitHub/.config-arcolinux
check_result "Failed backup.sh"



# MD
cp -r ~/.config/README.md ~/Documents/GitHub/.config-arcolinux
check_result "Failed to backup config.md/README.md"

echo "All files backed up successfully."
