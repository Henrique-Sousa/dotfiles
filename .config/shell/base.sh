#export TERM='xterm-256color'
export EDITOR='/usr/bin/vim'

# XDG base directory
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/x11/xserverrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export SCREENDIR="${XDG_RUNTIME_DIR}"/screen
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export W3M_DIR="$XDG_STATE_HOME"/w3m
export SQLITE_HISTORY="$XDG_STATE_HOME"/sqlite_history
export PYTHON_HISTORY="$XDG_STATE_HOME"/python_history
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME"/python
export PYTHONUSERBASE="$XDG_DATA_HOME"/python
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export BUN_INSTALL="$XDG_DATA_HOME"/bun
export PATH="$BUN_INSTALL/bin:$PATH"
export NVM_DIR="$XDG_DATA_HOME"/nvm
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PUB_CACHE="$XDG_CACHE_HOME"/dart/pub
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

#export LESS='-R --use-color -Dd+r$Du+b'
export LESS='-R'
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

export LC_COLLATE="C"

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'

# ! vi --version &> /dev/null && alias vi='vim'
! view --version &> /dev/null && alias view='vim -R'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# disable terminal freezing with ctrl + s, allowing to do a forward-search-history with ctrl + s
stty -ixon

eval $(keychain --eval --quiet --absolute --dir "$XDG_RUNTIME_DIR"/keychain)
