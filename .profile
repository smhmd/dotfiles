# Default programs:
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"
export FILE="lf"
export STATUSBAR="dwmbar"
export XIVIEWER="sxiv"

export COLORTERM="truecolor"

export INPUTRC="$HOME/.config/inputrc"
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

# PATH
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH" # NPM without sudo
export PATH="$HOME/.basher/bin:$PATH" # Basher
export PATH="$HOME/.gem/ruby/3.6.0/bin:$PATH" # Ruby
export PATH="$HOME/.cargo/bin:$PATH" # Cargo
export PATH="$HOME/.go/bin:$PATH" # Go

eval "$(basher init -)"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;40;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

eval "$(dircolors $HOME/.config/LS_COLORS)"
