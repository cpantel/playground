# start the image

# remove all the crap like 
#   gstreamer*
#   thunderbird*


sudo apt clean

sudo apt install zerofree

# GRUB steps:
# reboot
#  with shift
# advanced options
# recovery mode

#root
   mount -n -o remount,ro -t ext4 /dev/sda1 /
   zerofree /dev/sda1
   shutdown -h now

# si falla mount por mountpoint busy
# /etc/fstab -> noatime,ro
# por algún motivo, en ubuntu 20.0.4 en rescue mode / está read write

 

# useful post command or actions


VBoxManage clonehd --format input.vmdk output.vdi ; #optional


VBoxManage modifyhd input.vdi --compact


VBoxManage internalcommands sethduuid disk.vmdk


# relink output.vmdk as input.vmdk (manually, but there must be a cli way)

# Export the appliance

