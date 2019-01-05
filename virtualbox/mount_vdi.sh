# script for mounting vdi disk with qemu
modprobe nbd
qemu-nbd -c /dev/nbd0 "disk.vdi"
mount /dev/nbd0p1 /mnt
...
umount /mnt
qemu-nbd -d /dev/nbd0
