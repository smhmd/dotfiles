#############################################Statusbar loop
while true; do
   dwmbar
   sleep 60    # Update time every minute
done &



############################################ Autostart section
numlockx &

xrdb ~/.Xresources

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &

# Increase key speed via a rate change
xset r rate 300 50

# Map the caps lock key to super
#setxkbmap -option caps:hyper

# But when it is pressed only once, treat it as escape
#killall xcape 2>/dev/null ; xcape -e 'Hyper_L=Escape'

sxhkd &

unclutter --ignore-scrolling --jitter 1 &

setroot --blank-color "$(grep 'color16' ~/.Xresources  | awk '{print $2}')" &

dunst > /dev/null 2>&1 &



############################################ window manager
while true; do
	dwm 2> ~/.dwm.log
	dwm >/dev/null 2>&1
done
