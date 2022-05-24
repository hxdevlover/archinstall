#! /bin/bash

sudo pacman -Sy --noconfirm --needed xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings alacritty thunar bspwm sxhkd nitrogen picom firefox dmenu vim nano base-devel arandr

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.config/polybar

touch ~/.config/bspwm/bspwmrc
touch ~/.config/sxhkd/sxhkdrc
touch ~/.xprofile

tee -a ~/.config/bspwm/bspwmrc <<EOF

EOF

tee -a ~/.config/sxhkd/sxhkdrc <<EOF

EOF

systemctl enable lightdm

cd ~/
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R  hx:hx yay
cd yay
makepkg -si
cd ~/

yay -S polybar

tee -a ~/config/polybar/launch.sh <<EOF
#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
EOF

chmod +x ~/config/polybar/launch.sh
