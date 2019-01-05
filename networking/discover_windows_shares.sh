nmap  --script smb-enum-shares.nse -p445,137,139 -oG output.txt $OPTIONS $RANGE > shares.txt
