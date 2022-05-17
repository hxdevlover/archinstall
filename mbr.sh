#!bin/bash

# Run scrips after mount partitions and make sure you installed base, base-devel, linux and linux-firmware packages to /mnt...
# Install git and curl

mkdir /etc/pacman.d/bk
mv /etc/pacman.d/mirrorlist /etc/pacman.d/bk
touch /etc/pacman.d/mirrorlist
echo "Server = https://mirror.arvancloud.com/archlinux/$repo/os/$arch" >> /etc/pacman.d/mirrorlist
pacman -Syy

pacman -S vim networkmanager network-manager-applet linux-headers grub pulseaudio bash-completion openssh ntfs-3g dialog wpa_supplicant mtools dosfstools reflector xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups avahi

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime
hxclocl --systohc
sed -i '178s/.//' /etc/locale.gen
sed -i '234s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
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
systemctl enable reflector.timer
systemctl enable avahi-daemon

useradd -m hx
echo hx:password | chpasswd
usermod -aG wheel hx
sed -i '82s/.//' /etc/sudoers

