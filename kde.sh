#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

pacman -Sy xorg sddm plasma firefox papirus-icon-theme dolphin-plugins kde-system-meta ark kate kcalc kfind konsole unzip p7zip gwenview okular archlinux-wallpaper dbus tilix plasma-wayland-session vlc openvpn

sudo systemctl enable dbus
sudo systemctl enable sddm

reboot
