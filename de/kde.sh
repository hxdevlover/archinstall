#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

pacman -Sy --noconfirm xorg sddm plasma firefox papirus-icon-theme dolphin-plugins kde-system-meta ark kate kcalc kfind konsole unzip p7zip gwenview okular archlinux-wallpaper dbus tilix plasma-wayland-session vlc openvpn spectacle kwallet kwalletmanager alacritty kitty fish

# If you use Nvidia, Install these packages too:
# pacman -S xf86-video-nouveau nvidia nvidia-utils nvidia-settings

# If you use Intel, Install these packages too:
# pacman -S xf86-video-intel intel-ucode

# If you use AMD, Install these packages too:
# pacman -S xf86-video-amdgpu

sudo systemctl enable dbus
sudo systemctl enable sddm

reboot
