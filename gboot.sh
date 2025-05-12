#!/bin/bash

set -e 

echo "[+] INSTALL rEFInd (Bootloader)"
emerge -av sys-boot/refind

echo "[+] INSTALL  rEFInd to UEFI"
mkdir -p /boot/efi/EFI/refind
cp -r /usr/share/refind/* /boot/efi/EFI/refind/

echo "[+] SETTING rEFInd"

echo "[+] WRITE IN UEFI BOOT"
efibootmgr -c -d /dev/nvme0n1 -p 1 -L "rEFInd" -l '\EFI\refind\refind_x64.efi'

echo "[+] CREATE CONFIG FILE"
cat <<EOF > /boot/efi/EFI/refind/refind.conf
timeout 20
default_selection 0
scanfor manual
menuentry "Zen Gentoo" {
    icon /EFI/refind/icons/os_gentoo.png
    volume "Gentoo"
    loader /boot/vmlinuz-6.9.1-zen
    initrd /boot/initramfs-6.9.1-zen.img
    options "root=UUID=0801b164-e53a-46f1-9796-ba7da14ce5f7 ro quiet"
}
EOF
