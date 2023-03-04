#!/bin/bash
   while true
    do
       charging_status=$(cat /sys/class/power_supply/BAT1/status)
       battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
       if [[ $charging_status == 'Charging' ]]; then
           if [ $battery_level -ge 90 ]; then
              paplay ~/.local/share/sounds/Bixby.ogg
              dunstify "Battery Full: ${battery_level}% "
           fi
       else
           if [ $battery_level -le 20 ]; then
              paplay ~/.local/share/sounds/Bixby.ogg
              dunstify --urgency=normal "Battery Critically Low: ${battery_level}%"
           fi
       fi
     sleep 10
done
