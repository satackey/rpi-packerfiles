#!/bin/bash
set -ex

cd /home/pi/rtl8812au
apt-cache search linux-headers
apt-get install -y linux-headers-armhf-linuxkit
sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' Makefile
sed -i 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/g' Makefile
# mkdir -p /lib/modules/4.19.76-linuxkit/kernel/drivers/net/wireless/
make
make install
