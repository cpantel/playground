# better version
sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 addresses.txt


# my version
while read DEC_IP; do
  for OCTET in $( echo $DEC_IP | tr "." "\n") ; do
    printf '%02X' $OCTET
  done
  echo
done | sort | while read HEX_IP; do
  printf "%d.%d.%d.%d\n" 0x${HEX_IP:0:2} 0x${HEX_IP:2:2} 0x${HEX_IP:4:2} 0x${HEX_IP:6:2}
done
