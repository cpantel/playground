# start   = 63          = 32256
# end     = 78156224    = 40015986688
# sectors = 78156162    = 40015954944
# last    = 78156160
sudo mount -t ntfs -o loop,offset=32256,sizelimit=40015986688,ro image.hd.dd /mnt

