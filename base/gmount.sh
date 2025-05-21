#!/bin/bash

set -euo pipefail

echo "[+] MAKE /MNT/GENTOO"
mkdir -p /mnt/gentoo

echo "[+] MOUNT ROOT"
mount /dev/nvme0n1p2 /mnt/gentoo

echo "[+] MAKE BOOT & HOME"
mkdir -p /mnt/gentoo/boot/efi
mkdir -p /mnt/gentoo/home

echo "[+] MOUNT EFI"
mount /dev/nvme0n1p1 /mnt/gentoo/boot/efi

echo "[+] MOUNT HOME"
mount /dev/nvme0n1p3 /mnt/gentoo/home

