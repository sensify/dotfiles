#!/bin/bash

rofi_command="rofi -theme ~/.config/rofi/powermenu.rasi -height 50"

### Options ###
power_off=" Shutdown"
reboot=" Reboot"
log_out=" Log Out"
# Variable passed to rofi
options="$power_off\n$reboot\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        promptmenu --yes-command "systemctl poweroff"
        ;;
    $reboot)
        promptmenu --yes-command "systemctl reboot" 
        ;;
    $log_out)
        i3-msg exit
        ;;
esac

