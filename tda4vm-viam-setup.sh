#!/bin/bash
# this script assumes you have a freshly flashed tda4vm from following the instructions at https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-sk-tda4vm/latest/exports/docs/getting_started.html#software-setup

# set up GPIO as per https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-sk-tda4vm/latest/exports/docs/pi_hdr_programming.html?highlight=gpio#
cd /opt/edge_ai_apps
./scripts/install_ti_gpio_libs.sh
sed -i 's/name_overlays=k3-j721e-edgeai-apps.dtbo/name_overlays=k3-j721e-edgeai-apps.dtbo k3-j721e-sk-rpi-exp-header.dtbo/g' /run/media/mmcblk0p1/uEnv.txt

# obtain and install libfuse (dependency for viam-server) 
wget http://http.us.debian.org/debian/pool/main/f/fuse/libfuse2_2.9.9-1+deb10u1_arm64.deb
ar x libfuse2_2.9.9-1+deb10u1_arm64.deb
tar xvf data.tar.xz
mv lib/aarch64-linux-gnu/lib* /lib
ldconfig

# grab and install viam-server
wget http://packages.viam.com/apps/viam-server/viam-server-stable-aarch64.AppImage -O viam-server
chmod 755 viam-server
./viam-server --aix-install

# restart board (needed to get gpio functionality working
reboot now 
