#!/bin/bash

OPTIONS="Logout\nSuspend\nLock\nReboot\nShutdown"

CHOICE="$(echo -e $OPTIONS | wofi -i --dmenu --cache-file /dev/null)"
case $CHOICE in
    Logout)
	swaynag -t warning -m 'You pressed the Logout. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
	;;
    Suspend)
	swaynag -t warning -m 'You pressed the Suspend. Do you really want to Suspend?' -B 'Yes, Suspend' 'systemctl suspend'
	;;
    Lock)
	swaynag -t warning -m 'You pressed the Lock. Do you really want to activate swaylock?' -B 'Yes, Lock' 'swaylock -c 000000'
	;;
    Reboot)
	swaynag -t warning -m 'You pressed Reboot. Do you really want to Reboot?' -B 'Yes, Reboot' 'systemctl reboot'
	;;
    Shutdown)
	swaynag -t warning -m 'You pressed Shutdown. Do you really want to Shutdown?' -B 'Yes, Power off' 'systemctl poweroff -i'
	;;
esac
