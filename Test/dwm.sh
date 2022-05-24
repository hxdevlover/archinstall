#! /bin/bash
# Install yay with yay.sh file that you downloaded from repository.

sudo pacman -Sy --noconfirm --needed xorg arandr xorg-xrandr lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings nitrogen picom alacritty ttf-hack

cd ~/.config/
git clone https://git.suckless.org/dwm
cd dwm
sudo make clean install

cd ~/.config/
git clone https://git.suckless.org/dmenu
cd dmenu
sudo make clean install

cd ~/.config/
git clone https://git.suckless.org/st
cd st
sudo make clean install

#--------------------------------

sudo touch /usr/share/xsessions/dwm.desktop

sudo tee -a /usr/share/xsessions/dwm.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF

#--------------------------------

sudo touch ~/.xprofile

sudo tee -a ~/.xprofile <<EOF
nitrogen --restore &
picom -f &
setxkbmap us &
EOF
# xrandr (Display Configuration. Grab the right command form arandr script that you saved before.)
#--------------------------------

