source "$HOME/.config/shell/base.sh"

autoload -U colors && colors

export PS1="%B%{$fg[blue]%}%n@%M:%~%{$reset_color%}$%b "

# emacs keybindings
bindkey -e

# bash-like word movement and deletion behavior
WORDCHARS='' 
bindkey '^[b' emacs-backward-word
bindkey '^[f' emacs-forward-word
bindkey '^u'  vi-kill-line

# automatically cd into typed directory.
setopt autocd		

setopt interactive_comments

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_STATE_HOME"/zsh/history
setopt inc_append_history

# autoload -U compinit
autoload -Uz compinit
compinit
# zmodload zsh/complist

_comp_options+=(globdots)   # include hidden files.

# make completion smarter
zstyle ':completion:*' menu select                      # show a menu you can navigate
zstyle ':completion:*' matcher-list 'm:{a-z}={a-za-z}'  # case-insensitive
zstyle ':completion:*' list-colors ''                   # use ls colors
#zstyle ':completion:*' accept-exact true               # if you type an exact match, accept it
zstyle ':completion:*' squeeze-slashes true             # treat multiple slashes as one

# sort and prioritize by usage history
zstyle ':completion:*' sort true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' completer _complete _match _approximate

# bias toward recently used commands/paths
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' group-order local-directories path-directories

# autoload predict-on
# autoload -Uz predict-on
# predict-on

source "$ZDOTDIR"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$ZDOTDIR"/zsh-autosuggestions/zsh-autosuggestions.zsh
# killing more than one word and pasting will paste all the words in sequence
ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
    backward-kill-word
    kill-word
)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# source "$ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh"
# zstyle ':fzf-tab:*' switch-group ',' '.'  # group navigation keys
# zstyle ':completion:*' menu yes select
