# remove default gw binding to wifi
sudo route del -net 0.0.0.0 gw 10.0.0.1

# add route to my host through the wifi 
sudo route add -host IP.IP.IP.IP gw 10.0.0.1

