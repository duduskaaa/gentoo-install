#!/bin/bash

set -euo pipefail

echo "[+] INSTALL LINUX FIRMWARE"
emerge --ask sys-kernel/linux-firmware

echo "[+] CHECKING FOR FIRMWARE"
dmesg | grep firmware
