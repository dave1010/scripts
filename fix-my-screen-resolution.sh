#!/bin/bash
xrandr --addmode DVI-0 1680x1050
xrandr --output DVI-0 --mode 1680x1050
xrandr --output DVI-0 --left-of DVI-1

# http://askubuntu.com/questions/63681/how-can-i-make-xrandr-customization-permanent


# Edit: /etc/lightdm/lightdm.conf
# sudo ln -s ~/scripts/fix-my-screen-resolution.sh /usr/share/
# display-setup-script=/usr/share/mycustomloginvideo.sh
# session-setup-script=/usr/share/mycustomdesktopvideo.sh
