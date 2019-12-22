# put a window over the area that you want to record

INFO=$( xwininfo  )

WIDTH=$( echo "$INFO" | grep Width: | cut -d " " -f 4 )
HEIGHT=$( echo "$INFO" | grep Height: | cut -d " " -f 4 )
X=$( echo "$INFO" | grep "Absolute upper-left X" | cut  -d " " -f 7 )
Y=$( echo "$INFO" | grep "Absolute upper-left Y" | cut  -d " " -f 7 )


echo recordmydesktop -x "$X" -y "$Y" --width "$WIDTH" --height "$HEIGHT" --no-sound
