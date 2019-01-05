# start the image

# remove all the crap like 
#   gstreamer*
#   thunderbird*
#    apt-get clean


sudo apt-get install zerofree

# GRUB steps:
# reboot
#  with shift
# advanced options
# recovery mode

#root
   mount -n -o remount,ro -t ext4 /dev/sda1 /
   zerofree /dev/sda1
   shutdown -h now


# useful post command or actions


VBoxManage clonehd --format input.vmdk output.vdi ; #optional


VBoxManage modifyhd input.vdi --compact


VBoxManage internalcommands sethduuid disk.vmdk


# relink output.vmdk as input.vmdk (manually, but there must be a cli way)

# Export the appliance

