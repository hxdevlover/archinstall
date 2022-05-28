#! /bin/bash

#install Packages
sudo pacman -Sy --noconfirm --needed xorg xmonad xmonad-contrib xmobar xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings firefox vim nano networkmanager network-manager-applet pulseaudio volumeicon arc-gtk-theme arc-icon-themei papitus-icon-theme nitrogen picom alacritty arandr xorg-xrandr dmenu pcmanfm conky trayer htop fish lxappearance xterm

#install Fonts
sudo pacman -Sy --noconfirm --needed otf-font-awesome ttf-hack ttf-dejavu gnu-free-fonts noto-fonts ttf-roboto ttf-ubuntu-font-family ttf-anonymous-pro ttf-fira-mono ttf-fira-code adobe-source-code-pro-fonts adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji

yay -S ttf-mononoki

#Make lightdm start at startup
sudo systemctl enable lightdm

