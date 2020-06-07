echo -ne '\e[5 q'

# Prompt
PROMPT="%F{blue}%~ "

# History
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

# Shell Options
setopt correct                      # Auto correct mistakes
setopt extendedglob                 # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                   # Case insensitive globbing
setopt rcexpandparam                # Array expension with parameters
setopt nocheckjobs                  # Don't warn about running processes when exiting
setopt numericglobsort              # Sort filenames numerically when it makes sense
setopt nobeep                       # No beep
setopt appendhistory                # Immediately append history instead of overwriting
setopt histignorealldups            # If a new command is a duplicate, remove the older one
setopt autocd                       # if only directory path is entered, cd there.
setopt histignorespace              # commands prefixed with a space will not be added to HISTORY
setopt prompt_subst                 # enable substitution for prompt
setopt globdots                     # completion to show hidden files

# Completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                       # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
#zstyle ':completion:*' menu select

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>|'  # Don't consider certain characters part of the word (old implementation: WORDCHARS=${WORDCHARS//\/[&.;]})


# Alias
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/securealiasrc" ] && source "$HOME/.config/securealiasrc"

# Autoload
# zplugin
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin compinit colors
(( ${+_comps} )) && _comps[zplugin]=_zplugin
colors
# Check completion once a day https://gist.github.com/ctechols/ca1035271ad134841284
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;


# Keybindings
bindkey -e
bindkey '^[[7~' beginning-of-line                   # Home key
bindkey '^[[H' beginning-of-line                    # Home key
bindkey '^[[8~' end-of-line                         # End key
bindkey '^[[F' end-of-line                          # End key
bindkey '^[[2~' overwrite-mode                      # Insert key
bindkey '^[[3~' delete-char                         # Delete key
bindkey '^[[C'  forward-char                        # Right key
bindkey '^[[D'  backward-char                       # Left key
bindkey '^[[5~' history-beginning-search-backward   # Page up key
bindkey '^[[6~' history-beginning-search-forward    # Page down key
bindkey '^[[1;5D' backward-word                     # Ctrl + Left
bindkey '^[[1;5C' forward-word                      # Ctrl + Right
bindkey '^[[Z' undo                                 # Shift + tab undo last action
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

_zsh_cli_fg() { fg; }                               ##
zle -N _zsh_cli_fg                                  # set ctrl+z to run fg if not jobs
bindkey '^Z' _zsh_cli_fg                            ##


# Shortcuts
hash -d c=$HOME/.config
hash -d bin=$HOME/.local/bin
hash -d src=$HOME/.local/src
hash -d b=$HOME/build
hash -d m=$HOME/media

hash -d projects=$HOME/projects
hash -d articles=$HOME/media/articles
hash -d books=$HOME/media/books
hash -d courses=$HOME/media/courses
hash -d film=$HOME/media/film
hash -d lectures=$HOME/media/lectures
hash -d music=$HOME/media/music
hash -d pix=$HOME/media/pix
hash -d podcasts=$HOME/media/podcasts
hash -d talks=$HOME/media/talks
hash -d tv=$HOME/media/tv

hash -d downloads=/tmp/downloads

# Functions
function e {
  if [ $# -eq 0 ]; then

    $EDITOR -c 'e #<1'
  else
    $EDITOR "$@"
  fi
}

# Plugins
[ -f "/home/me/.config/zsh/.zinitplugins" ] && source "/home/me/.config/zsh/.zinitplugins"
