#!/bin/bash

set -euo pipefail

echo "[+] INSTALLING ESELECT REPOSITORY"
emerge --quiet-build app-eselect/eselect-repository

echo "[+] ENABLING ZEN-OVERLAY"
eselect repository enable zen-overlay
emerge --sync

echo "[+] INSTALLING ZEN-SOURCES"
emerge --quiet-build sys-kernel/zen-sources

echo "[+] SEARCHING FOR LATEST ZEN KERNEL SOURCES"
latest_kernel=$(ls -1d /usr/src/linux-zen-* 2>/dev/null | sort -V | tail -n 1)
if [[ -z "$latest_kernel" ]]; then
  echo "[+] ERROR: NO ZEN KERNEL SOURCES FOUND IN /USR/SRC, CHECK INSTALLATION."
  exit 1
fi

ln -sf "$latest_kernel" /usr/src/linux
cd /usr/src/linux

echo "[+] OPENING KERNEL CONFIGURATION (MAKE MENUCONFIG)"
make menuconfig

echo "[+] COMPILING KERNEL"
make -j"$(nproc)"
make modules_install
make install

echo "[+] DONE! CHECK /BOOT AND UPDATE REFIND.CONF MANUALLY OR AUTOMATE IT."

