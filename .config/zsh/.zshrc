source "$HOME/.config/shell/base.sh"

autoload -U colors && colors

export PS1="%B%{$fg[blue]%}%n@%M:%~%{$reset_color%}$%b "

# emacs keybindings
bindkey -e

# bash-like word deletion behavior
# bindkey '^[^?' vi-backward-kill-word    # alt+backspace: delete alphanumeric words
# bindkey '^w'   backward-kill-word       # ctrl+w: delete until whitespace
my-backward-kill-word () {
   local WORDCHARS=''
   zle -f kill
   zle .backward-kill-word
}
zle -N my-backward-kill-word
bindkey '\e^?' my-backward-kill-word

# automatically cd into typed directory.
setopt autocd		

setopt interactive_comments

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_STATE_HOME"/zsh/history
setopt inc_append_history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # include hidden files.

ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
    backward-kill-word
    vi-backward-kill-word
    unix-word-rubout
    my-backward-kill-word
)
source "$ZDOTDIR"/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$ZDOTDIR"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
