#!/bin/bash

set -e

echo "[+] MAKE /MNT/GENTOO"
mkdir -p /mnt/gentoo

echo "[+]MOUNT ROOT"
mount /dev/nvme0n1p2 /mnt/gentoo

mkdir -p /mnt/boot/efi
mkdir -p /mnt/home

echo "[+]MOUNT EFI"
mount /dev/nvme0n1p1 /mnt/boot/efi

echo "[+]MOUNT HOME"
mount /dev/nvme0n1p3 /mnt/home

