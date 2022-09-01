# numlockx &                                                                       # Enable numbers in keyboard
xrdb ~/.Xresources &                                                               # Load Xresources
xset r rate 300 50 &                                                               # Increase key speed via a rate change
sxhkd &                                                                            # Hotkey daemon
copyq &                                                                            # Clipboard management
unclutter --ignore-scrolling --jitter 1 &                                          # Remove mouse on idle
dunst &                                                                            # Notification daemon
# sudo hostctl enable --all -q &                                                     # /etc/hosts manager
# setroot --contrast '2' -c /home/me/media/pix/1596928796488.jpg &                   # Set wallpaper
setroot -fw /home/me/media/pix/background.png
xmodmap ~/.Xmodmap &                                                               # Load keyboard layout overrides
autorandr --change &                                                               # Detect and set up screen layout profile

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec spectrwm
