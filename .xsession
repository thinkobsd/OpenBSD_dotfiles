#!/bin/ksh
export ENV=$HOME/.kshrc

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# DBus
if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
  eval `dbus-launch --sh-syntax --exit-with-session`
fi

## no bell
xset b 0 0 0

# Termbar
exec xterm -fs 12 -bg "black" -fg "grey" -name termbar -class termbar -T termbar -e ~/termbar &

xhost +si:localuser:root

ulimit -Sc 0

# Wallpaper
feh --bg-scale /home/ueulo/Pictures/nordic-wallpapers-master/ign_waifu.png  &
mpd ~/.config/mpd/mpd.conf
xterm &
dunst &

exec cwm 
