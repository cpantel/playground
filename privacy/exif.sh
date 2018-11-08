$FIND | while read FILE; do
   echo "Processing $FILE";
   exiftool -all= "$FILE";
done

# Being $FIND something like:
#   ls *.png
#   find -iname *.png
