source "$HOME/.config/shell/base.sh"

export PS1='\[\033[1;94m\]\u@\h:\w\[\033[00m\]$ '
export HISTCONTROL="ignoreboth:erasedups"

# XDG base directory
export HISTFILE="$XDG_STATE_HOME"/bash/history

shopt -s extglob;
