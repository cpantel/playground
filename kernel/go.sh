sudo rmmod charDevice 
sudo insmod charDevice.ko debug=1 major=197
echo "one" > charDevice2
cat charDevice2
echo "two" >> charDevice2
cat charDevice2
dmesg | tail

