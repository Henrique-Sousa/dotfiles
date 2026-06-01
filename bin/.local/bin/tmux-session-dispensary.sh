#!/bin/bash

DIRS1=(
    "$HOME/notas"
#    "$HOME/notas/learn"
#    "$HOME/notas/learn/comput"
#    "$HOME/notas/learn/comput/programming/"
    "$HOME/dev"
#    "$HOME/dev/github"
    "$HOME/code"
    "$HOME/tmp"
#    "$HOME/tmp/github"
#    "$HOME/tmp/github/dotfiles"
    "$HOME/docs"
#    "$HOME/docs/livros"
)

DIRS2=(
    "$HOME"
    "$HOME/.config"
    "$HOME/.local"
)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(
        cat \
            <(fd . "${DIRS1[@]}" --type=dir --full-path --base-directory $HOME) \
            <(fd . "${DIRS2[@]}" --type=dir --max-depth=1 --full-path --base-directory $HOME) \
        | sed "s|^$HOME/||" \
        | fzf --no-separator --no-scrollbar --border=none --cycle --margin 10% --color="bw"
    )

    [[ $selected ]] && selected="$HOME/$selected"
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "$selected_name"; then
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
