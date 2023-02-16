Connection=$(nmcli | grep wlo1:\ connected\ | sed 's/wlo1:/Wifi/g')
Volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
Mute=$(pactl list sinks | grep '^[[:space:]]Mute:' | head -n $(( $SINK + 1 )) | tail -n 1 | cut -d ":" -f2 | sed -e 's/^[ \t]*//')
if [ $Mute = "yes" ]; then
	Vol="Muted"
else
	Vol="$Volume%"
fi
Brightness=$(brightnessctl | grep Current | cut -d '(' -f2 | cut -d '%' -f1)
Battery=$(cat /sys/class/power_supply/BAT1/capacity)
Battery_Status=$(cat /sys/class/power_supply/BAT1/status)
Date=$(date +'%Y-%m-%d %I:%M %p')
echo "$Connection | Volume $Vol | Brightness $Brightness% | $Battery_Status $Battery% | $Date"
