# Default programs:
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export CODE="code"
export TERMINAL="st"
export BROWSER="google-chrome-stable"
export READER="zathura"
export FILE="lf"
export STATUSBAR="dwmbar"
export XIVIEWER="sxiv"

export font="Iosevka:size=8"

export background='#1c1c1c'
export foreground='#eeeeee'
export black0='#1c1c1c'
export black1='#7c7c7c'
export red0='#cc3833'
export red1='#d75f5f'
export green0='#7fa110'
export green1='#1cab5d'
export yellow0='#fcba03'
export yellow1='#ffc54a'
export blue0='#3685c9'
export blue1='#4ea5f2'
export magenta0='#954ea3'
export magenta1='#a867b5'
export cyan0='#67b5a5'
export cyan1='#9cd9d7'
export white0='#d9d9d9'
export white1='#ffffff'

export COLORTERM="truecolor"

export ZDOTDIR="$HOME/.config/zsh"
export KEYTIMEOUT=1

export PODCAST="$HOME/media/podcasts"
export GOPATH="$HOME/.go"

# Files
export zshrc="$HOME/.config/zsh/.zshrc"
export profile="$HOME/.profile"
export aliasrc="$HOME/.config/aliasrc"
export securealiasrc="$HOME/.config/securealiasrc"
export dwmrc="$HOME/build/dwm/config.h"
export strc="$HOME/build/st-flexipatch/config.h"
export lfrc="$HOME/.config/lf/lfrc"
export xinitrc="$HOME/.xinitrc"
export ncmrc="$HOME/.config/ncmpcpp/config"
export mpvrc="$HOME/.config/mpv/mpv.conf"
export mpvinp="$HOME/.config/mpv/input.conf"
export vimrc="$HOME/.vimrc"
export mimerc="$HOME/.config/mimi/mime.conf"
export sxhkdrc="$HOME/.config/sxhkd/sxhkdrc"
export zathurarc="$HOME/.config/zathura/zathurarc"
export pistolrc="$HOME/.config/pistol/pistol.conf"
export dunst="$HOME/.config/dunst/dunstrc"

export NPM_PACKAGES="${HOME}/.npm-packages"
export prefix="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# PATH & FPATH
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export PATH="$HOME/.local/bin:$PATH" # Local bin
export PATH="/home/me/.local/bin/android-apps:$PATH" # Android apps
export PATH="$NPM_PACKAGES/bin:$PATH" # NPM without sudo
export PATH="$HOME/.basher/bin:$PATH" # Basher
export PATH="$HOME/.cargo/bin:$PATH" # Cargo
export PATH="$HOME/.go/bin:$PATH" # Go
export PATH="$(ruby -e 'puts Gem.user_dir'):$PATH" # Ruby

export FPATH="$HOME/.local/bin:$FPATH" # Local bin (FPATH)

# Flutter/Android
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export PATH=$ANDROID_SDK_ROOT/emulator:$PATH

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;40;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

export OPENAUDIBLE_HOME="$HOME/media/audiobooks"

eval "$(dircolors $HOME/.config/LS_COLORS)"

mkdir -p /tmp/downloads
[[ ! -L /tmp/downloads/articles ]] && ln -s $HOME/media/articles /tmp/downloads/articles
[ "$(tty)" = "/dev/tty2" ] && ! pgrep -x Xorg >/dev/null && date +'%d %A %R' && exec startx
