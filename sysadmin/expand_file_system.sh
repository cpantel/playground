sudo umount /dev/sdb1
sudo umount /dev/sdb2
sudo fdisk /dev/sdb

#d
#n
#w

sudo e2fsck -f /dev/sdb2
sudo resize2fs /dev/sdb2

# fancy example:
# https://seguridad-agile.blogspot.com/2018/08/parallella-paradumbs-trabajando-mas.html
# search for "Expandiendo el filesystem"
