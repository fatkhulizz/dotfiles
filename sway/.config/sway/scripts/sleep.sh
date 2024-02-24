#!/bin/sh
swayidle -w \
	timeout 600 '$HOME/.config/sway/scripts/sswaylock' \
	timeout 600 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"' \
	timeout 900 'systemctl suspend' \
	resume 'swaymsg "output * dpms on"' \
	before-sleep '$HOME/.config/sway/scripts/sswaylock' &
