#!/usr/bin/env bash

# Options
shutdown='Shut Down'
reboot='Reboot'
suspend='Suspend'
logout='Logout'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme $HOME/.config/sway/rofi/powermenu.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$shutdown)
	systemctl poweroff
	;;
$reboot)
	systemctl reboot
	;;
$suspend)
	systemctl suspend
	;;
$logout)
	swaymsg exit
	;;
esac
