#!/bin/bash

echo "setting up the 'wrk' tmux session"

# wrk:0 'console'
# wrk:1 'edit' .0 vim .1 bash
# wrk:2 'rt'
# wrk:3 'C'

tmux new-session -s wrk -n TODO -d
tmux split-window -v -t wrk:0
tmux resize-pane -t wrk:0.0 -D 12

tmux new-window -t wrk -n edit
tmux split-window -v -t wrk:1
tmux split-window -h -t wrk:1.1
tmux resize-pane -t wrk:1.0 -D 25

tmux new-window -t wrk -n tests
tmux split-window -h -t wrk:2

#tmux new-window -t wrk -n C
#tmux split-window -h -t wrk:3
#tmux split-window -v -t wrk:3.1
#tmux resize-pane -t wrk:3.0 -L 33
#
#tmux new-window -t wrk -n ruby
#tmux split-window -h -t wrk:4
#tmux split-window -v -t wrk:4.1
#tmux resize-pane -t wrk:4.0 -L 33
#
#tmux send-keys -t wrk:0.0 'vim ~/TODO.txt' C-m
#tmux send-keys -t wrk:1.0 'vim .' C-m
#tmux send-keys -t wrk:2.1 '~/scripts/cryptmount.sh' C-m
#tmux send-keys -t wrk:2.2 'htop' C-m
#tmux send-keys -t wrk:3.0 'cd ~/c' C-m
#tmux send-keys -t wrk:3.1 'cd ~/c' C-m
#tmux send-keys -t wrk:4.0 'cd ~/ruby' C-m
#tmux send-keys -t wrk:4.1 'cd ~/ruby' C-m

tmux select-window -t :2
tmux select-pane -t 1

tmux -2 attach -t wrk
