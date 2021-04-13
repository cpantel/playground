
for CAT in "to_attend" "to_download" "to_download and attend" "to_download and attend waiting link" "to_download waiting link" "to_classify"; do 
  echo "################################################"
  echo "$CAT"
  #find . -path "*/$CAT/*" -type d | grep -ve "${CAT}$" | rev | cut -d"/" -f 1 | rev | while read WEBINAR; do
  find . -path "*/$CAT/*" -type d | rev | cut -d"/" -f 1 | rev | while read WEBINAR; do
    echo $(find . -iname "$WEBINAR" | cut -d "/" -f 2) " $WEBINAR" 
  done
  echo 
done
