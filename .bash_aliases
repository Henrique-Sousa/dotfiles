alias ls='ls --color=auto --group-directories-first --time-style=long-iso'
alias l='ls -CF'
alias ll='ls -lF '
alias la='ls -AF'
alias lla='ls -AlF'

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
    find -iname "*$1*" ${@:2};
}

