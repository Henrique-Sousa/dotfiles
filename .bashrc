export PS1='\[\033[1;94m\]\u@\h:\w\[\033[00m\]$ '
export EDITOR='/usr/bin/vi'
export TERM='xterm-256color'
export HISTCONTROL="ignoreboth:erasedups"
export LESS='-R --use-color -Dd+r$Du+b'

alias ls='ls --color --group-directories-first'
alias grep='grep --color'
alias vi='vim'
alias view='vi -R'

shopt -s extglob;

# disable terminal freezing with Ctrl + s, allowing to do a forward-search-history with Ctrl + s
stty -ixon
