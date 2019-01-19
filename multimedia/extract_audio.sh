MP4=$1
MP3=$2
mencoder "$MP4" -of rawaudio -oac mp3lame -ovc copy -o "$MP3"
