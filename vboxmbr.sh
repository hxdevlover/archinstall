#!/bin/bash

# Run scrips after mount partitions and make sure you installed base, base-devel, linux and linux-firmware packages to /mnt...
# Install git and curl

pacman -Sy grub networkmanager network-manager-applet dialog mtools dosfstools reflector os-proper xdg-user-dirs xdg-utils virtualbox-guest-utils

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

grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m hx
echo hx:password | chpasswd
usermod -aG wheel hx
sed -i '82s/.//' /etc/sudoers

