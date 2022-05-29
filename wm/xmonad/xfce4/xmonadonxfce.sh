#! /bin/bash

sudo pacman -Sy --noconfirm --needed xorg xmonad xmonad-contrib lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet pulseaudio alacritty dmenu htop fish lxappearance xterm nitrogen
sudo pacman -R xfdesktop

sudo touch $HOME/.xprofile
sudo tee -a $HOME/.xprofile <<EOF
nitrogen --restore &
xmonad --replace &
pulseaudio --start &
EOF

sudo systemctl enable lightdm
