#!/bin/bash

cd ./linux-sunxi

echo "Starting build please check config first ..."
sleep 10

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig

echo -en "Calculating amount of CPU's available ... "
CPUS=$(grep '^processor' /proc/cpuinfo | wc -l)
echo "${CPUS} found."

echo "Starting build of uImage and modules ..."
make -j${CPUS} ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- uImage modules


echo "Placing compiled modules, firmware and headers in output directory."

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=output INSTALL_HDR_PATH=output modules_install headers_install


echo "Compiling done."
