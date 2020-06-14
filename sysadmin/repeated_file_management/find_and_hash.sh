find / -type f -iname "*.pdf" -o -iname "*.mobi" -o -iname "*.epub" | while read BOOK; do
  md5sum "$BOOK"
done
