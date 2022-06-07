#!/bin/bash

sudo pacman -Sy --noconfirm xorg sddm plasma firefox papirus-icon-theme dolphin-plugins kde-system-meta ark kate kcalc kfind konsole unzip p7zip gwenview okular archlinux-wallpaper dbus plasma-wayland-session vlc openvpn spectacle kwallet kwalletmanager alacritty fish

# If you use Nvidia, Install these packages too:
# sudo pacman -S xf86-video-nouveau nvidia nvidia-utils nvidia-settings

# If you use Intel, Install these packages too:
# sudo pacman -S xf86-video-intel intel-ucode

# If you use AMD, Install these packages too:
# sudo pacman -S xf86-video-amdgpu

sudo systemctl enable dbus
sudo systemctl enable sddm

