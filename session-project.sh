#!/bin/bash

wd="$HOME/projects/$1"
cd "$wd"
swaymsg splith
swaymsg "exec kitty -d \"$wd\""
sleep 0.1
swaymsg splitv
swaymsg "exec kitty -d \"$wd\""
helix
