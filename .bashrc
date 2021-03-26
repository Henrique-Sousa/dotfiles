shopt -s extglob
set -o noclobber    # the redirection will fail if the file already exists 
stty -ixon          # disable terminal freezing with Ctrl + s, allowing to do a forward-search-history with Ctrl + s

alias ls='ls --color=auto --group-directories-first --time-style=long-iso'
alias l='ls -CF'
alias ll='ls -lF '
alias la='ls -AF'
alias lla='ls -AlF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias grept='grep --include=*.{txt,md}' 

# top running processes by highest memory usage
alias psmem='ps -A -o pid,tty,%mem,%cpu,comm --sort=-%mem  | head -35'
# top running processes by highest cpu usage
alias pscpu='ps -A -o pid,tty,%mem,%cpu,comm --sort=-%cpu  | head -35'

# group processes with the same name and show memory usage
gmem() { 
  echo $1 $(ps -C $1 -o %mem= | paste -sd+ | bc)% mem
}
# group processes with the same name and show cpu usage
gcpu() { 
  echo $1 $(ps -C $1 -o %cpu= | paste -sd+ | bc)% cpu
}

rank_grouped_processes_by_mem() {
  for process in $(ps -e -o comm | sort -u); do
    gmem $process; 
  done | sort -rhk2
}

alias tops="rank_grouped_processes_by_mem | less"

# show processes by memory usage, grouped by process name 
taskmem(){
  rank_grouped_processes_by_mem | 
  while read instance; do 
    echo $instance; 
    echo $instance | awk '{print $1}' | xargs -o ps -o tty,pid,comm,%mem --sort=-%mem --no-headers -C; 
  done | less
}

alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias xvp="xargs -d '\n' -o vim -p"

seek() {
    find -iname "*$1*";
}


if [ -a "$HOME/.PS1" ]; then
  source $HOME/.PS1
fi

# set LS_COLORS environment variable from a separate dotfile
if [ -e "$HOME/.ls_colors" ]; then
	. $HOME/.ls_colors
fi

# man pages colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

export EDITOR='/usr/bin/vim'

export PATH=$PATH:/home/user1/programs/anaconda3/bin

