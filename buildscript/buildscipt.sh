#!/bin/bash

if [ `uname -m` != "armv7l" ]
then
	echo "No armv7l hardware found, using CROSS_COMPILE."
	COMPILEOPTIONS="CROSS_COMPILE=arm-linux-gnueabihf-"
else
	echo "armv7l hardware found, not using CROSS_COMPILE."
	COMPILEOPTIONS=¨
fi


cd ./linux-sunxi

echo "Starting build please check config first ..."
sleep 10

make ARCH=arm ${COMPILEOPTIONS} menuconfig

echo -en "Calculating amount of CPU's available ... "
CPUS=$(grep '^processor' /proc/cpuinfo | wc -l)
echo "${CPUS} found."

echo "Starting build of uImage and modules ..."
make -j${CPUS} ARCH=arm ${COMPILEOPTIONS} uImage modules

echo "Placing compiled modules, firmware and headers in output directory."
make ARCH=arm ${COMPILEOPTIONS} INSTALL_MOD_PATH=output INSTALL_HDR_PATH=output modules_install headers_install

echo "Compiling done."
