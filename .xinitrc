# Statusbar loop
while true; do
   xsetroot -name "[$(cat /sys/class/power_supply/BAT0/capacity)] $( date +" [%F] [%R] " )"
   sleep 60    # Update time every minute
done &

# Autostart section
nitrogen --restore &
numlockx &
# qbittorrent-nox &
#mpd &
#dunst > /dev/null 2>&1 &
xrdb ~/.Xresources

while true; do
	dwm 2> ~/.dwm.log
	dwm >/dev/null 2>&1
done
