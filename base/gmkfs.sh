#!/bin/bash

set -euo pipefail

echo "[+] FILESYSTEM FAT"
mkfs.vfat -F32 /dev/nvme0n1p1

echo "[+] FILESYSTEM EXT4 -> ROOT"
mkfs.ext4 -F /dev/nvme0n1p2

echo "[+] FILESYSTEM EXT4 -> HOME"
mkfs.ext4 -F /dev/nvme0n1p3
