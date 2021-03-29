TIME=$(( $1 * 60 + $2 ))
echo "Select which window to record"
echo "Press CRTL-C to cancel"
echo
ID=$( xwininfo | grep "Window id" | cut -d : -f 3 | cut -d" " -f 2 )
echo "Recording $1:$2 ($TIME seconds)"
echo "Press CRTL-C to stop recording"
echo -n "Starts in 5 "
sleep 5

recordmydesktop --windowid=$ID &
RMDPID=$( jobs -p | tail -1 )

sleep ${TIME}
/bin/kill -2 ${RMDPID}

