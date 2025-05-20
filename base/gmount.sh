#!/bin/bash

set -euo pipefail

echo "[+] MAKE /MNT/GENTOO"
mkdir -p /mnt/gentoo

echo "[+] MOUNT ROOT"
mount /dev/nvme0n1p2 /mnt/gentoo

echo "[+] MAKE BOOT & HOME"
mkdir -p /mnt/boot/efi
mkdir -p /mnt/home

echo "[+] MOUNT EFI"
mount /dev/nvme0n1p1 /mnt/boot/efi

echo "[+] MOUNT HOME"
mount /dev/nvme0n1p3 /mnt/home

