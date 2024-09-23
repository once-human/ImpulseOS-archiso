sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
git clone https://aur.archlinux.org/hyprland-git.git
cd hyprland-git
makepkg -si
cd ..
rm -rf hyprland-git

# Repeat for hyprctl, hyprutils-git, and waybar-hyprland-git
yay -Syu hyprland-git
yay -Syu hyprctl
yay -Syu hyprutils-git
yay -Syu waybar-hyprland-git