1. Install KDE and Xmonad by running kde-xmonad.sh

2. Copy [ picom.conf ] to [ /etc/xdg/ ] and from system settings add picom to autostart -- run picom with [ picom --experimental-backend ] command.

3. In [ $HOME/ ] make a directory and name it [ .xmonad ] -- Copy xmonad.hs there and run [ xmonad --recompile ]

4. In [ $HOME/.config/plasma-workspace/env ] make a file and name it [ set_window_manager.sh ] -- In that file write [ export KDEWM=/usr/bin/xmonad ] -- make it executable.

