#!/bin/bash

# Run scrips after mount partitions and make sure you installed base, base-devel, linux and linux-firmware packages to /mnt...
# Install git and curl

pacman -Sy --noconfirm grub efibootmgr networkmanager network-manager-applet dialog mtools dosfstools xdg-user-dirs xdg-utils nfs-utils inetutils dnsutils bluez bluez-utils cups pulseaudio bash-completion openssh reflector acpi acpi_call acpid ipset os-prober ntfs-3g

ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime
hwclocl --systohc
sed -i '178s/.//' /etc/locale.gen
sed -i '234s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:1234 | chpasswd

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable reflector.timer
systemctl enable acpid

useradd -m [USER]
echo [USER]:1234 | chpasswd
usermod -aG wheel [USER]
sed -i '82s/.//' /etc/sudoers
