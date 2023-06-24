export TERM='xterm-256color'
export PS1='\[\033[1;94m\]\u@\h:\w\[\033[00m\]$ '
export HISTCONTROL="ignoreboth:erasedups"
export EDITOR='/usr/bin/vim'

#export LESS='-R --use-color -Dd+r$Du+b'
export LESS='-R'
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

alias ls='ls --color --group-directories-first'
alias grep='grep --color'

if ! view --version &> /dev/null; then
    alias view='vi -R'
fi

if ! vi --version &> /dev/null; then
    alias vi='vim'
fi

shopt -s extglob;

# disable terminal freezing with Ctrl + s, allowing to do a forward-search-history with Ctrl + s
stty -ixon

eval $(keychain --eval --quiet)
