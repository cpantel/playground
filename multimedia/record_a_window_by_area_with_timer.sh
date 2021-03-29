TIME=$(( $1 * 60 + $2 ))
echo "Put a window over the area that you want to record and select it"
echo "Press CRTL-C to cancel"
echo

INFO=$( xwininfo  )

WIDTH=$( echo "$INFO" | grep Width: | cut -d " " -f 4 )
HEIGHT=$( echo "$INFO" | grep Height: | cut -d " " -f 4 )
X=$( echo "$INFO" | grep "Absolute upper-left X" | cut  -d " " -f 7 )
Y=$( echo "$INFO" | grep "Absolute upper-left Y" | cut  -d " " -f 7 )
echo "Recording $1:$2 ($TIME seconds)"
echo "Press CRTL-C to stop recording"
echo -n "Starts in 5 "
sleep 5

recordmydesktop -x "$X" -y "$Y" --width "$WIDTH" --height "$HEIGHT" &
RMDPID=$( jobs -p | tail -1 )

sleep ${TIME}
/bin/kill -2 ${RMDPID}

