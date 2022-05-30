#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

pacman -Sy --noconfirm --needed xorg sddm plasma thunar thunar-volman firefox papirus-icon-theme materia-kde materia-gtk-theme ksystemlog gparted ark kate kcalc kfind kcron unzip p7zip gwenview okular archlinux-wallpaper dbus vlc openvpn spectacle kwallet kwalletmanager alacritty fish

# If you use Nvidia, Install these packages too:
# pacman -S xf86-video-nouveau nvidia nvidia-utils nvidia-settings plasma-wayland-session 

# If you use Intel, Install these packages too:
# pacman -S xf86-video-intel intel-ucode

# If you use AMD, Install these packages too:
# pacman -S xf86-video-amdgpu

# Install more icons (Install yay first -- Run yay.sh script):
# yay -Sy fluent-icon-theme-git

sudo systemctl enable dbus
sudo systemctl enable sddm

reboot
