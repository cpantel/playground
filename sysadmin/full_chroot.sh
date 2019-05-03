# para rescates que impliquen usar el sistema siendo rescatado
# por ejemplo, corregir grub

mount /dev/XXX /mnt

cd /mnt
mount -t proc proc proc/
mount -t sysfs sys sys/
mount -o bind /dev dev/

sudo chroot /mnt /bin/bash
