#!/bin/bash

sudo pacman -Sy --noconfirm --needed base-devel git

sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R  hx:hx yay
cd yay
makepkg -si
