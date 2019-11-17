# Statusbar loop
while true; do
   xsetroot -name "$( date +" [%F] [%R] " )"
   sleep 1m    # Update time every minute
done &

# Autostart section
sh ~/.fehbg & 
#compton &
numlockx &
mpd &
dunst > /dev/null 2>&1 &
xrdb ~/.Xresources &

while true; do
	dwm 2> ~/.dwm.log
	dwm >/dev/null 2>&1
done

