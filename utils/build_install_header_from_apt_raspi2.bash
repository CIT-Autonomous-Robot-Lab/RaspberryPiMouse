#!/bin/bash -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0})/../; pwd)

# check kernel headers
[ ! -e /usr/src/linux-headers-$(uname -r) ] && { bash -e $SRC_DIR/utils/print_env.bash "No kernel header files found."; exit 1; }

# build and install the driver
cd $SRC_DIR/src/drivers/
rm Makefile
ln -s Makefile.header_from_apt Makefile
make clean
make
sudo install -D -m 644 rtmouse.ko /lib/modules/$(uname -r)/extra/rtmouse.ko
sudo depmod -a
sudo modprobe rtmouse

# initialize the driver
sleep 1
sudo chmod 666 /dev/rt*
echo 0 > /dev/rtmotoren0
