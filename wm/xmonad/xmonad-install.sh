#! /bin/bash

#install Packages
sudo pacman -Sy --noconfirm --needed xorg xmonad xmonad-contrib xmobar lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings firefox vim nano networkmanager network-manager-applet pulseaudio volumeicon arc-gtk-theme arc-icon-theme papirus-icon-theme nitrogen picom alacritty arandr xorg-xrandr dmenu pcmanfm conky trayer htop fish lxappearance xterm

#Make lightdm start at startup
sudo systemctl enable lightdm

