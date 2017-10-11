#!/bin/bash
# mail window 1
tmux new-session -d -s 'Workspace' -n 'Editor'
tmux split-window -v -p 20
tmux select-pane -t 2
tmux split-window -h -p 50
# org window 2
tmux new-window -t 'Workspace' -n 'Server'
tmux split-window -v -p 50
tmux select-pane -t 1
#tmux split-window -h
#tmux select-pane -t 3
#tmux split-window -h
# web window 3
tmux new-window -t 'Workspace' -n 'Local'
#tmux split-window -h -p 40
#tmux select-pane -t 2
#tmux split-window -v
tmux select-window -t Workspace:3
tmux select-window -t Workspace:2
tmux select-window -t Workspace:1
tmux attach -t Workspace
