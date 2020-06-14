find / -type f -exec basename {} \; | sort | uniq -c | sort -nr
