#!/bin/bash

# Run Illogical Impulse dotfiles setup script
bash <(curl -s "https://end-4.github.io/dots-hyprland-wiki/setup.sh")

# Get the currently logged-in user's home directory
USER_HOME=$(eval echo ~${SUDO_USER})

# Force replace the hypr directory with the customized one
cp -rf /etc/skel/.config/hypr "$USER_HOME/.config/"

# Ensure ownership and permissions are correct
chown -R ${SUDO_USER}:${SUDO_USER} "$USER_HOME/.config/hypr"
git clone https://github.com/LazyVim/starter ~/.config/nvim
systemctl enable gdm.service
