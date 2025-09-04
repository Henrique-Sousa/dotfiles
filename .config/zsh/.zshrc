source "$HOME/.config/shell/base.sh"

# automatically cd into typed directory.
setopt autocd		

setopt interactive_comments

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_STATE_HOME"/zsh/history
setopt inc_append_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

autoload -U colors
colors


source "$ZDOTDIR"/zsh-autosuggestions/zsh-autosuggestions.zsh
# make zsh-autosuggestions not mess up the keybindings
# preserve:
#   killing more than one word and then pasting will paste all the killed words in sequence
#   yank-pop (M-y): rotate the kill-ring, and yank the new top
ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
    kill-word           # alt + d
    backward-kill-word  # alt + backspace
    unix-word-rubout    # ctrl + w
    backward-kill-line  # ctrl + u
    yank                # ctrl + y
    yank-pop            # alt + y
)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# emacs keybindings
bindkey -e

# bash-like word movement and deletion behavior
WORDCHARS='' 
bindkey '^[b' emacs-backward-word
bindkey '^[f' emacs-forward-word
bindkey '^u' backward-kill-line 

unix-word-rubout() {
    local WORDCHARS="\`~!@#\$%&^*()-_=+[]{};:\"|,<.>/?'\\"
    # local WORDCHARS='`~!@#$%&^*()-_=+[]{};:\"|,<.>/?\'\'
    zle -f kill
    zle .backward-kill-word
}
zle -N unix-word-rubout
bindkey '^w' unix-word-rubout


# Completion System

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

# source "$ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh"
# zstyle ':fzf-tab:*' switch-group ',' '.'  # group navigation keys
# zstyle ':completion:*' menu yes select


export PS1="%B%{$fg[blue]%}%n@%M:%~%{$reset_color%}$%b "

source "$ZDOTDIR"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
