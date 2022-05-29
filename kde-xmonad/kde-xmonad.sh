#! /bin/bash

sudo pacman -Sy --noconfirm --needed xorg sddm plasma xmonad xmonad-contrib picom pcmanfm firefox papirus-icon-theme materia-kde materia-gtk-theme ksystemlog gparted ark kate kcalc kfind kcron unzip p7zip gwenview okular archlinux-wallpaper dbus vlc openvpn spectacle kwallet kwalletmanager alacritty fish xfce4-appfinder

# If you use Nvidia, Install these packages too:
# pacman -S xf86-video-nouveau nvidia nvidia-utils nvidia-settings

# If you use Intel, Install these packages too:
# pacman -S xf86-video-intel intel-ucode

# If you use AMD, Install these packages too:
# pacman -S xf86-video-amdgpu

sudo systemctl enable dbus
sudo systemctl enable sddm
