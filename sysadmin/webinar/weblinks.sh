
find . -path "*/to_attend/*" -iname "*ogv" -o -iname "*avi"  | while read WEBINAR; do
   ln -s "../$WEBINAR" zone4transfer
done
