#! /bin/bash

sudo pacman -Sy --noconfirm --needed xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings alacritty thunar bspwm sxhkd nitrogen picom firefox dmenu vim nano base-devel arandr

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.config/polybar

touch ~/.config/bspwm/bspwmrc
touch ~/.config/sxhkd/sxhkdrc
touch ~/.xprofile

tee -a ~/.config/bspwm/bspwmrc <<EOF
#! /bin/sh

pgrep -x sxhkd > /dev/null || sxhkd &
\$HOME/.config/polybar/launch.sh

bspc monitor -d 1 2 3 4 5 6 7 8 9 10

bspc config border_width         2
bspc config window_gap           6
bspc config single_monocle                false
bspc config click_to_focus                true
bspc config focus_by_distance             true
bspc config focus_follows_pointer         true
bspc config history_aware_focus           true


bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

#### BSPWM coloring ####
bspc config normal_border_color		      "#4c566a"
bspc config active_border_color	              "#1e1e1e"
bspc config focused_border_color	      "#5e81ac"
bspc config presel_feedback_color	      "#5e81ac"
bspc config urgent_border_color 	      "#dd2727"

bspc rule -a Gimp desktop='^8'
bspc rule -a firefox desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
EOF

tee -a ~/.config/sxhkd/sxhkdrc <<EOF
#
# wm independent hotkeys
#

# terminal emulator
super + Return
	alacritty

# program launcher
super + d
	dmenu_run

# make sxhkd reload its configuration files:
super + Escape
	pkill -USR1 -x sxhkd

# Thunar
super + shift + Return
	thunar

#
# bspwm hotkeys
#

# quit/restart bspwm
super + alt + {q,r}
	bspc {quit,wm -r}

# close and kill
super + {_,shift + }q
	bspc node -{c,k}

# alternate between the tiled and monocle layout
super + m
	bspc desktop -l next

# send the newest marked node to the newest preselected node
super + y
	bspc node newest.marked.local -n newest.!automatic.local

# swap the current node and the biggest window
super + g
	bspc node -s biggest.window

#
# state/flags
#

# set the window state
super + {t,shift + t,s,f}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# set the node flags
super + ctrl + {m,x,y,z}
	bspc node -g {marked,locked,sticky,private}

#
# focus/swap
#

# focus the node in the given direction
super + {_,shift + }{h,j,k,l}
	bspc node -{f,s} {west,south,north,east}

# focus the node for the given path jump
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# focus the next/previous window in the current desktop
super + {_,shift + }c
	bspc node -f {next,prev}.local.!hidden.window

# focus the next/previous desktop in the current monitor
super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# focus the last node/desktop
super + {grave,Tab}
	bspc {node,desktop} -f last

# focus the older or newer node in the focus history
super + {o,i}
	bspc wm -h off; \
	bspc node {older,newer} -f; \
	bspc wm -h on

# focus or send to the given desktop
super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

#
# preselect
#

# preselect the direction
super + ctrl + {h,j,k,l}
	bspc node -p {west,south,north,east}

# preselect the ratio
super + ctrl + {1-9}
	bspc node -o 0.{1-9}

# Launch Firefox
ctrl + alt + f
	firefox

# cancel the preselection for the focused node
super + ctrl + space
	bspc node -p cancel

# cancel the preselection for the focused desktop
super + ctrl + shift + space
	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

#
# move/resize
#

# expand a window by moving one of its side outward
super + alt + {h,j,k,l}
	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

# contract a window by moving one of its side inward
super + alt + shift + {h,j,k,l}
	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

# move a floating window
super + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}
EOF

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

tee -a ~/.xprofile <<EOF
nitrogen --restore &

picom -f &
EOF

systemctl enable lightdm
