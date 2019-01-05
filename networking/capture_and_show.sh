sudo /usr/sbin/tcpdump -s0 -w output.pcap -i eth0 "(host xx.xx.xx.xx || host xx.xx.xx.xx) && port 514"
tshark -r output.pcap
