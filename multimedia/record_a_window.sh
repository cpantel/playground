ID=$( xwininfo | grep "Window id" | cut -d : -f 3 | cut -d" " -f 2 )

recordmydesktop --windowid=$ID --no-sound
