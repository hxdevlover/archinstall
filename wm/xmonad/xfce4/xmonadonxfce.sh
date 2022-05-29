#! /bin/bash

sudo pacman -Sy --noconfirm --needed xorg xmonad xmonad-contrib lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet pulseaudio alacritty dmenu htop fish lxappearance xterm nitrogen

sudo systemctl enable lightdm
