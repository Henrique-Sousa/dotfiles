export PS1='\[\033[1;94m\]\u@\h:\w\[\033[00m\]$ '
export EDITOR='/usr/bin/vi'
export TERM='xterm-256color'

alias ls='ls --color --group-directories-first'
alias grep='grep --color'

shopt -s extglob

# disable terminal freezing with Ctrl + s, allowing to do a forward-search-history with Ctrl + s
stty -ixon

source "$HOME/.scripts/ppm.sh"
