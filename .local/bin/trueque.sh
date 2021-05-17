#!/bin/bash

SESSION="trueque"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "$SESSIONEXISTS" = "" ]
then
    tmux new-session -d -s $SESSION

    tmux rename-window -t 1 'API'
    tmux send-keys -t 'API' 'cd /Users/nil/gogo/src/github.com/nilventosa/truequeAPI' C-m
    tmux send-keys -t 'API' 'vim' C-m

    tmux new-window -t $SESSION:2 -n 'servers'
    tmux send-keys -t 'servers' 'cd /Users/nil/gogo/src/github.com/nilventosa/truequeAPI' C-m
    tmux send-keys -t 'servers' 'go run cmd/trueque_api.go config.yaml' C-m
    tmux split-window -t 'servers' -v
    tmux send-keys -t 'servers' 'cd /Users/nil/gogo/src/github.com/nilventosa/truequeAPI' C-m

    tmux new-window -t $SESSION:3 -n 'mariadb'
    tmux send-keys -t 'mariadb' 'mysqld' C-m
fi

tmux attach-session -t $SESSION:1
