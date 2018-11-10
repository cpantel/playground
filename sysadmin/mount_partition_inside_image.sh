IMAGE=ubuntu-14.04-headless-z7010-20150130.1.img
IMAGE="$1"
fdisk --list "$IMAGE" | \
  awk '
    BEGIN {
      show = 0
      count = 1
    }
    /Units: .*/ {
       bytes = $6
    }
    /.*/ {
      if (show) {
        if ($2 == "*") {
           offset = $3 * bytes
        } else {
           offset = $2 * bytes
        }
        print "# " $1 " " $3 " " offset
        print "sudo losetup -o " offset " /dev/loop"count" \"'$IMAGE'\"" 
        print "sudo mkdir \"/mnt/" $1"\""
        print "sudo mount /dev/loop"count" \"/mnt/" $1"\""
        print "# your commands  \"'$IMAGE'\""
        print "sudo umount /dev/loop"count
        print "sudo rmdir \"/mnt/" $1"\""
        print "sudo losetup -d /dev/loop"count
        print " "
        count++
      }
    }
    /^Device.*/ {
      show=1
    }'



# losetup --read-only

# losetup --partscan not tried yet


# https://askubuntu.com/questions/69363/mount-single-partition-from-image-of-entire-disk-device
