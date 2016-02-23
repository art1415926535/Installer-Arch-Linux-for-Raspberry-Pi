#!/bin/bash -e


file1="ArchLinuxARM-rpi-latest.tar.gz"
file2="ArchLinuxARM-rpi-2-latest.tar.gz"
url1="http://archlinuxarm.org/os/ArchLinuxARM-rpi-latest.tar.gz"
url2="http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz"



case "$1" in 
	"1" )
		if [ -f "$file1" ]; 
		then	
			while true; do
    				read -p "Re-download image Arch Linux for Raspberry Pi from website? " yn
    				case $yn in
        				[Yy]* ) rm $file1 && wget $url1; break;;
        				[Nn]* ) break;;
        				* ) echo "Please answer yes or no.";;
    				esac
			done
		else
			wget $file1;
		fi
		sudo tar -xpf $file1 -C root
	;;

	"2" )
		if [ -f "$file2" ]; 
		then	
			while true; do
    				read -p "Re-download image Arch Linux for Raspberry Pi 2 from website? " yn
    				case $yn in
        				[Yy]* ) rm $file2 && wget $url2; break;;
        				[Nn]* ) break;;
        				* ) echo "Please answer yes or no.";;
    				esac
			done
		else
			wget $url2;
		fi		
		sudo tar -xpf $file2 -C root
	;;
			
	* )
		if [ -f "$1" ];
		then
			sudo tar -xpf $1 -C root
		else
			echo "Usage: " 
			echo "	./write_image.sh 1  - for Raspberry Pi 1" 
			echo "	./write_image.sh 2  - for Raspberry Pi 2"
			echo "	./write_image.sh <path_to_image>  - for already downloaded image"
			exit
		fi
	;;
esac

echo "Sync..."
sync

echo "Move boot..."
sudo mv root/boot/* boot/

echo "Umount..."
sudo umount boot root

rm -rf boot root

echo "Done!"
