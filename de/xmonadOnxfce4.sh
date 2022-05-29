#! /bin/bash

sudo pacman -S --noconfirm --needed xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xmonad xmonad-contrib xfce4 xfce4-goodies firefox papirus-icon-theme materia-gtk-theme vlc unzip p7zip pcmanfm archlinux-wallpaper nitrogen alacritty fish xterm

sudo pacman -R thunar thunar-volman xfdesktop xfce4-terminal

sudo mkdir $HOME/.xmonad
sudo cp -r $HOME/archinstall/wm/xmonad/xfce4/xmonad.hs $HOME/.xmonad

sudo mkdir $HOME/.config/alacritty
sudo cp -r $HOME/archinstall/alacritty.yml $HOME/.config/alacritty

xmonad --recompile

# If you use Nvidia, Install these packages too:
# pacman -S xf86-video-nouveau nvidia nvidia-utils nvidia-settings

# If you use Intel, Install these packages too:
# pacman -S xf86-video-intel intel-ucode

# If you use AMD, Install these packages too:
# pacman -S xf86-video-amdgpu

sudo systemctl enable lightdm


