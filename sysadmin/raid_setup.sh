#https://raid.wiki.kernel.org/index.php/RAID_setup


# fdisk -> type 0xDA

mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb /dev/sdc
mdadm --assemble --verbose /dev/md0 /dev/sdb /dev/sdc
mdadm --detail --scan >> /etc/mdadm/mdadm.conf

mkfs.ext4 /dev/md0





