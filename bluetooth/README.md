Bluetooth support
=================

The file ./etc/init.d/brcm40183-patch uploads the firmware to the brcm40183 at boot time.

It has the following dependencies:

#Bluez package
This package supplies the commands hcitool and hciattach and can be installed by:

	apt-get install bluez


#Bluetooth libraries to support brcm_patchram_plus
The following libraries are required to support brcm_patchram_plus:

	apt-get install libbluetooth3 libbluetooth-dev


#Kernelmodules
The folowing kernelmodules should be loaded:

	rfcomm
	bnep
	hci_uart
	bluetooth
	hidp

Otherwise they have to be compiled into the kernel.

#/etc/default/brcm40183
This file contains the default MAC Address and portname to be used to flash the chipset.
If this file does not exists a default address and port wil be selected. 

#/usr/local/bin/brcm_patchram_plus
Utility to upload the firmware to the bluetooth chip.
Place this file into the directory /usr/local/bin and make it executable.
Modified sources can be found at https://github.com/kdeenkhoorn/cubietruck-scripts/tree/master/sources/broadcom-bluetooth .
Originals ar at https://code.google.com/p/broadcom-bluetooth/ .

#/etc/init.d/brcm40183-patch
This script will start the firmware upload at boot time.
It checks if the firmware has allready been uploaded by checking the existents of a hci(x) device.
If not, the upload starts with a command time-out of 60 seconds in case the upload goes wrong some how.
Logging from the upload can be found in /var/log/brcm40183.firmware .

#Activation:
Copy the file ./etc/init.d/brcm40183-patch to /etc/init.d as root and make it executable:

	cp brcm40183-patch /etc/init.d
	chmod 755 /etc/init.d/brcm40183-patch

Copy the file ./etc/default/brcm40183 to /etc/default as root and make it executable:

	cp brcm40183 /etc/default
	chmod 755 /etc/default/brcm40183

Review this file and change it if needed.

The execution at boot time can be activated by using the command:

	update-rc.d -f brcm40183-patch defaults

Have fun! 
