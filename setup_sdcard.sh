#!/bin/bash -e

if [ $# -ne 1 ]
then
        echo "Invalid argument please pass only one argument"
        echo "example: ./setup_sdcard /dev/mmcblk0"
	exit 1;
fi

p1="$1p1"
p2="$1p2"

# to create the partitions programatically (rather than manually)
# we're going to simulate the manual input to fdisk
# The sed script strips off all the comments so that we can 
# document what we're doing in-line with the actual commands
# Note that a blank line (commented as "defualt" will send a empty
# line terminated with a newline to take the fdisk default.

sed -e 's/\t\([\+0-9a-zA-Z]*\)[ \t].*/\1/' << EOF | sudo fdisk $1
 	o	# delete existing partitions
 	p	# show partitions
 	n	# new partition
 	p	# primary partition
 		# default partition: 1
		# default first sector
	+100M	# +100M for the last sector
		
	t	# set the first partition to type
	c	# W95 FAT32 (LBA)
		
	n	# new partition
	p	# primary partition
	2	# partion number 2
		# default, start immediately after preceding partition
		# default, extend partition to end of disk
	p	# print the in-memory partition table
	w	# write the partition table
	q	# quit
EOF

mkdir boot
sudo mkfs.vfat $p1 && echo "Created FAT filesystem on $p1" && sudo mount $p1 boot && echo "$p1 mounted to boot"

mkdir root
sudo mkfs.ext4 $p2 && echo "Created ext4 filesystem on $p2" && sudo mount $p2 root && echo "$p2 mounted to root"

echo "Done!"
echo "to continue run write_image.sh"
