#!bin/bash

mkdir /etc/pacman.d/bak
mv /etc/pacman.d/mirrorlist /etc/pacman.d/bak
touch /etc/pacman.d/mirrorlist
echo "Server = https://mirror.arvancloud.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
pacman -Syy
