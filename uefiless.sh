#!/bin/bash

# Run scrips after mount partitions and make sure you installed base, base-devel, linux and linux-firmware packages to /mnt...
# Install git and curl

pacman -S vim networkmanager network-manager-applet grub pulseaudio bash-completion openssh ntfs-3g xdg-user-dirs xdg-utils

ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime
hxclocl --systohc
sed -i '178s/.//' /etc/locale.gen
sed -i '234s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable sshd

useradd -m hx
echo hx:password | chpasswd
usermod -aG wheel hx
sed -i '82s/.//' /etc/sudoers
