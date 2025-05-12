#!/bin/bash

set -e

echo "[+] ADD USER"
useradd -m -G wheel -s /bin/bash khatep

echo "[+] PASSWORD FOR USER:"
passwd khatep

echo "[+] INSTALL SUDO"
emerge --ask sys-apps/sudo
visudo
