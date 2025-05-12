#!/bin/bash

set -e

echo "[+] COPY /etc/resolv.conf -> /mnt/gentoo/etc/"
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/

echo "[+] MOUNT PSEUDO FILESYSTEMS (sys, proc, dev, run)"
mount --types proc /proc /mnt/gentoo/proc || { echo "Mount /proc failed"; exit 1; }
mount --rbind /sys /mnt/gentoo/sys || { echo "Mount /sys failed"; exit 1; }
mount --rbind /dev /mnt/gentoo/dev || { echo "Mount /dev failed"; exit 1; }
mount --bind /run /mnt/gentoo/run || { echo "Mount /run failed"; exit 1; }
mount --make-slave /mnt/gentoo/run || { echo "Failed to make /run slave"; exit 1; }

echo "[-] IF YOU WANT -> init-systemd:"
echo "mount --make-rslave /mnt/gentoo/sys"
echo "mount --make-rslave /mnt/gentoo/dev"

echo "[+] CHROOT IN /mnt/gentoo"
chroot /mnt/gentoo /bin/bash <<EOF
source /etc/profile
export PS1="(chroot) ${PS1}"
EOF
