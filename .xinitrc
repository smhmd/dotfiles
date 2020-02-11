while true; do
   dwmbar
   sleep 60    # Update time every minute
done &

numlockx > /dev/null 2>&1 &
xrdb ~/.Xresources > /dev/null 2>&1
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap > /dev/null 2>&1 &
# Increase key speed via a rate change
xset r rate 300 50 > /dev/null 2>&1
# Map the caps lock key to super
#setxkbmap -option caps:hyper
# But when it is pressed only once, treat it as escape
#killall xcape 2>/dev/null ; xcape -e 'Hyper_L=Escape'
sxhkd > /dev/null 2>&1 &
unclutter --ignore-scrolling --jitter 1 > /dev/null 2>&1 &
setroot --blank-color "$(grep 'color16' ~/.Xresources  | awk '{print $2}')" > /dev/null 2>&1 &
dunst > /dev/null 2>&1 &

while true; do
	dwm 2> ~/.dwm.log
	dwm >/dev/null 2>&1
done
