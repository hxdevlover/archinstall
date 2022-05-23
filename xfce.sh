#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo pacman -S --noconfirm xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies firefox arc-gtk-theme arc-icon-theme papirus-icon-theme vlc unzip p7zip archlinux-wallpaper 

# If you use Nvidia, Install these packages too:
# pacman -S xf86-video-nouveau nvidia nvidia-utils nvidia-settings

# If you use Intel, Install these packages too:
# pacman -S xf86-video-intel intel-ucode

# If you use AMD, Install these packages too:
# pacman -S xf86-video-amdgpu

sudo systemctl enable lightdm

reboot
