while true; do
   dwmbar
   sleep 2
done &

numlockx > /dev/null 2>&1 &                                                                         # Enable numbers in keyboard
xrdb ~/.Xresources > /dev/null 2>&1                                                                 # Load Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap > /dev/null 2>&1 &                                        # Load keyboard layout overrides
xset r rate 300 50 > /dev/null 2>&1                                                                 # Increase key speed via a rate change
sxhkd > /dev/null 2>&1 &                                                                            # Hotkey daemon
clipmenud > /dev/null 2>&1 &                                                                        # Clipboard management
unclutter --ignore-scrolling --jitter 1 > /dev/null 2>&1 &                                          # Remove mouse on idle
setroot --blank-color "$(grep 'color16' ~/.Xresources  | awk '{print $2}')" > /dev/null 2>&1 &      # Wallpaper
dunst > /dev/null 2>&1 &                                                                            # Notification daemon

while true; do
	dwm 2> ~/.dwm.log
	dwm >/dev/null 2>&1
done
