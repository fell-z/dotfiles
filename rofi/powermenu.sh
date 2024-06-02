#! /usr/bin/bash
#
chosen=$(printf "󰐥 Power Off\n Restart\n󰤄 Suspend\n Log out" | rofi -dmenu -i -l 4)
case "$chosen" in 
	"󰐥 Power Off") shutdown -h now;;
	" Restart") reboot ;;
  "󰤄 Suspend") loginctl suspend ;;
  " Log out") i3-msg exit ;;
	*) exit 1 ;;
esac
