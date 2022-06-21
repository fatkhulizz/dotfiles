#!/bin/bash

tmux new-window cmus
tmux split-window -h lyrics
tmux select-pane -L
