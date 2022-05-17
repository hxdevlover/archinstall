#!bin/sh

mkdir /etc/pacman.d/bk
mv /etc/pacman.d/mirrorlist /etc/pacman.d/bk
touch /etc/pacman.d/mirrorlist
echo "Server = https://mirror.arvancloud.com/archlinux/$repo/os/$arch" >> /etc/pacman.d/mirrorlist
pacman -Syy
