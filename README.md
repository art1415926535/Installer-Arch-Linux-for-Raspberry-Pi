------------------------
# Raspberry Pi scripts
------------------------


## What you will need:

* A linux machine with a SD card slot.
* Installed `tar` and `fdisk`.

------------------------
# Quick install Arch Linux on Raspberry Pi
**1. Download this repository**
```
git clone https://github.com/art1415926535/Raspberry-Pi-scripts.git && cd Raspberry-Pi-scripts
```
<br>
**2. Set the permissions**
```
chmod +x setup_sdcard.sh && chmod +x write_image.sh
```
<br>
**3. Run scripts**
```
./setup_sdcard.sh <path> && ./write_image.sh <number or image>
```
* `<path>` - path to SD Card
* `<number or image>` - number of version Raspberry Pi or path to image Arch Linux

example:
`./setup_sdcard.sh /dev/mmcblk0 && ./write_image.sh 2`

------------------------
# Detailed manual

## First step
Download this repository <br>
```
git clone https://github.com/art1415926535/Raspberry-Pi-scripts.git
cd Raspberry-Pi-scripts
```


## Setup Arch Linux on the SD card

### 1. Set the permissions
Make setup_sdcard.sh and write_image.sh executable: <br>
`chmod +x setup_sdcard.sh && chmod +x write_image.sh` 
* setup_sdcard.sh - formate the SD card with fdisk and create filesystems.
* write_image.sh - download the image from the website (if you want) and write the files onto the SD Card.


### 2. Run setup the SD card
`./setup_sdcard.sh /dev/mmcblk0` <br><br>
Wait message: <br>
`Done!
To continue run write_image.sh`


### 3 Run download and write image onto the SD Card

If you already downloaded image go to step 3.1.

* `./write_image.sh 1`  - for Raspberry Pi 1 <br>
* `./write_image.sh 2`  - for Raspberry Pi 2

If directory already contain image you you will get a question: <br> 
`Re-download the image from the website [yes/no]?`

After write image onto the SD Card go to step 4.


### 3.1 For already downloaded image
`./write_image.sh <path_to_image>`


### 4. Profit!!!

Use the serial console or SSH to the IP address given to the board by your router.

Login as the default user `alarm` with the password `alarm`.
The default `root` password is `root`.



### Sources:
* My experiences
* http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2
