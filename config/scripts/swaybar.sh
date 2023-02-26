# Network Connection
connection=$(nmcli | grep connected\ to | cut -d ' ' -f2-4 | sed 's/connected/Connected/g')

# Speaker volume Section
left_speaker=$(amixer | grep Left:\ Playback | cut -d " " -f7 | grep -o '[[:digit:]]*')
right_speaker=$(amixer | grep Right:\ Playback | cut -d " " -f7 | grep -o '[[:digit:]]*')
left_speaker_status=$(amixer | grep Left:\ Playback | cut -d " " -f8 | grep -o '[[:alpha:]]*')
right_speaker_status=$(amixer | grep Right:\ Playback | cut -d " " -f8 | grep -o '[[:alpha:]]*')

if [[ $left_speaker_status -eq $right_speaker_status ]]; then
        speaker_status=$right_speaker_status
else
        volume="ONE SPEAKER OFF!!!"
fi
if [[ $speaker_status == 'on' ]]; then
        if [[ $left_speaker -eq $right_speaker ]]; then
                volume=$right_speaker%
        else
                volume="Left: $left_speaker%, Right: $right_speaker%"
        fi
else
        volume="Muted"
fi

# Brightness Section
brightness=$(brightnessctl | grep Current | cut -d ' ' -f4 | grep -o '[[:digit:]]*')

# Battery Section
battery_status=$(cat /sys/class/power_supply/BAT1/status)
battery_percent=$(cat /sys/class/power_supply/BAT1/capacity)

# Date Time
date_time=$(date +'%Y-%m-%d %I:%M %p')

# echo output
echo "$connection | Volume $volume | Brightness $brightness% | $battery_status $battery_percent% | $date_time"
