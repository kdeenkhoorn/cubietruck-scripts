Bluetooth support
=================

The file ./etc/init.d/brcm40183-patch uploads the firmware to the brcm40183 at boot time.

It has the following dependencies:

#/etc/default/brcm40183
This file contains the default MAC Address to be used by the chipset.</ br>
If this file does not exists a default address wil be selected.</ br> 

#/usr/local/bin/brcm_patchram_plus
Utility to upload the firmware to the bluetooth chip.</ br>
Modified sources can be found at https://github.com/kdeenkhoorn/cubietruck-scripts/tree/master/sources/broadcom-bluetooth .</ br>
Originals ar at https://code.google.com/p/broadcom-bluetooth/ .</ br>

#/etc/init.d/brcm40183-patch
This script will start the firmware upload at boot time.</ br>
It checks if the firmware has allready been uploaded by checking the existents of a hci(x) device.</ br>
If not the upload starts with a command time-out of 60 seconds in case the upload goes wrong some how.</ br>
Logging from the upload can be found in /var/log/brcm40183.firmware .</ br>


Activation:
The execution at boot time can be activated by using the command:

	insserv brcm40183-patch
 
