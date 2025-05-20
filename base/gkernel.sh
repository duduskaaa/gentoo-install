#!/bin/bash

set -euo pipefail

echo "[+] INSTALLING ESELECT REPOSITORY"
emerge --ask app-eselect/eselect-repository

echo "[+] ENABLING ZEN OVERLAY"
eselect repository enable zen-overlay
emerge --sync

echo "[+] INSTALLING ZEN-SOURCES"
emerge --ask sys-kernel/zen-sources

echo "[+] SELECTING NEW KERNEL"
latest_kernel=$(ls -1d /usr/src/linux-zen-* | sort -V | tail -n 1)
ln -sf "$latest_kernel" /usr/src/linux
cd /usr/src/linux

echo "[+] OPENING KERNEL CONFIG"
make menuconfig

echo "[+] COMPILING KERNEL"
make -j$(nproc)
make modules_install
make install

echo "[+] DONE — CHECK /boot FOR vmlinuz-* AND update refind.conf"
