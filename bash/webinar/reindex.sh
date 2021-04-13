
find zone4transfer -iname "*.mp4" -o -iname "*.pdf" -o -iname "*.ogv" | sort | while read FILE; do
  FILE=$( basename "$FILE" )
  echo "<a href=\"./$FILE\">$FILE</a><br/>"
done  >zone4transfer/index.html

php -t zone4transfer -S $( ip addr show dev enp3s0 | grep "inet " | cut -d " " -f 6 | cut -d "/" -f 1):8080
