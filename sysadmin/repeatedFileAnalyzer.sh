find . -type f | while read FILE; do md5sum "$FILE"; done | sort > md5sums.lst
cut -d" " -f 1 md5sums.lst | sort | uniq -c | sort -n | grep -ve "^      1" | cut -b 9- > repeatedHashes.lst
fgrep --file repeatedHashes.lst md5sums.lst | \
    grep -ve "\.c$" -ve "\.h$" -ve "\.gif$" -ve "\.css$" -ve "\.js$" -ve "Makefile" -ve "load$" \
    > repeatedFiles.lst
