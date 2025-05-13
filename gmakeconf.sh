#!/bin/bash

set -e
echo "IF YOU WANT TO CONFIGURE MANUALLY -> nano /mnt/gentoo/etc/portage/make.conf"

conf=/mnt/gentoo/etc/portage/make.conf

echo "[+] ADD MIRRORS -> PORTAGE FLAGS" 
emerge --ask --verbose --oneshot app-portage/mirrorselect
mirrorselect -D -s4 >> $conf

echo "[+] CONGIG PORTAGE FLAGS"
echo 'COMMON_FLAGS="-O2 -march=native -pipe"' >> "$conf"
echo 'CFLAGS="$COMMON_FLAGS"' >> "$conf"
echo 'CXXFLAGS="$COMMON_FLAGS"' >> "$conf"
echo 'MAKEOPTS="-j12"' >> "$conf"
echo 'VIDEO_CARDS="nvidia"' >> "$conf" 
echo 'ACCEPT_LICENSE="*"' >> "$conf"

# CLEAN UP
nano /mnt/gentoo/etc/portage/make.conf
