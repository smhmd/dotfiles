numlockx &                                                                         # Enable numbers in keyboard
xrdb ~/.Xresources &                                                               # Load Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &                                        # Load keyboard layout overrides
xset r rate 300 50 &                                                               # Increase key speed via a rate change
sxhkd &                                                                            # Hotkey daemon
# clipmenud &                                                                        # Clipboard management
unclutter --ignore-scrolling --jitter 1 &                                          # Remove mouse on idle
dunst &                                                                            # Notification daemon
# sudo hostctl enable --all -q &                                                     # /etc/hosts manager
setroot --contrast '2' -fw /home/me/media/pix/1596928796488.jpg &                  # Set wallpaper

exec spectrwm
