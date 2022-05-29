#! /bin/bash

sudo pacman -Sy --noconfirm --needed xorg xmonad xmonad-contrib alacritty htop fish lxappearance xterm nitrogen xfce4-appfinder xfce4-whiskermenu-plugin
sudo pacman -R xfdesktop

sudo systemctl enable lightdm
