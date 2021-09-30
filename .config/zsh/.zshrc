export LC_CTYPE=en_CA.UTF-8
export LC_ALL=en_CA.UTF-8
export LANG=en

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
#PS1="%B%{$fg[red]%}|%{$fg[green]%}%M%{$fg[magenta]%}%{$fg[red]%}|%{$fg[yellow]%} %~%{$fg[red]%} %{$fg[magenta]%}$%{$reset_color%} %B"
PS1="%{$fg[yellow]%}$%{$reset_color%} %B"
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# remove background colors
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

# History file in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/.histfile

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

bindkey -s '^o' 'lfcd\n'  # zsh

# Use ranger to switch directories and bind it to ctrl-o
#function ranger-cd {
#    tempfile="$(mktemp -t tmp.XXXXXX)"
#    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
#    test -f "$tempfile" &&
#    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
#        cd -- "$(cat "$tempfile")"
#    fi
#    rm -f -- "$tempfile"
#}
# bindkey -s '^o' 'ranger-cd\n'  # zsh

# terminal call neomutt
bindkey -s '^n' 'neomutt\n'

# History incremental search backward
bindkey '^r' history-incremental-search-backward

# classic shell deletion shortcuts
bindkey '^a' vi-beginning-of-line
bindkey '^e' vi-end-of-line
bindkey '^k' kill-line

# xrandr startup config
# bindkey -s '^x' 'setxkbmap -symbols "pc+us+inet(evdev)+capslock(ctrl_modifier)+ctrl(lctrl_meta)+ctrl(swap_rwin_rctl)"\n'

# show storage of the hard drive
bindkey -s '^d' 'df -h | grep /home\n'

# aliases
alias -s pdf=zathura

# zsh auto suggestion
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^a' autosuggest-accept
bindkey '^ ' autosuggest-execute
bindkey '^x' autosuggest-toggle

# Load zsh-syntax-highlighting; should be last.
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
