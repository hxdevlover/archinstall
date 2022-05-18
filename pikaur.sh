#!bin/bash

sudo pacman -Sy git curl

git clone https://aur.archlinux.org/pikaur.git
cd pikaur/
makepkg -si
