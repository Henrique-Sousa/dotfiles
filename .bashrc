alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -a "$HOME/.PS1" ]; then
  . $HOME/.PS1
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


cd ~

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export EDITOR='/usr/bin/vim'


# >>> Auto-launching ssh-agent >>>
#if [ -x "$(command -v keychain)"  -a -e "$HOME/.ssh/windows_github_rsa" ]; then 
	#eval $(keychain --eval $HOME/.ssh/windows_github_rsa)
#fi
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
  (umask 077; ssh-agent >| "$env")
  . "$env" >| /dev/null ; 
}

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
  agent_start
  ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
  ssh-add
fi

unset env
# <<< Auto-launching ssh-agent <<<


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/user1/programs/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/user1/programs/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/user1/programs/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/user1/programs/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

