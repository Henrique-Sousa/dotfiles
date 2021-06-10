export PS1='\[\033[1;94m\]\u@\h:\w\[\033[00m\]$ '
alias ls='ls --color'
export EDITOR=vi

# disable terminal freezing with Ctrl + s, allowing to do a forward-search-history with Ctrl + s
stty -ixon
