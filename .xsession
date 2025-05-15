xhost +si:localuser:root
#!/bin/sh -x

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export XMODIFIERS=@im=uim
export GTK_IM_MODULE="uim"
export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1

## no bell
xset b 0 0 0

# DBus
if [ -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --auto-syntax --exit-with-session`
fi

# Termbar
exec xterm -fs 12 -bg "black" -fg "grey" -name termbar -class termbar -T termbar -e ~/termbar &

xhost +si:localuser:root

ulimit -Sc 0

# Wallpaper
feh --bg-scale /home/ueulo/Pictures/nordic-wallpapers-master/ign_waifu.png  &
xterm &
dunst &

exec cwm 
