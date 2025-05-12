#!/bin/bash

set -e

echo "[+] INSTALL LINUX FIRMWARE"
# Установка пакета с прошивками
emerge --ask sys-kernel/linux-firmware

echo "[+] CHECKING FOR FIRMWARE"
# Проверка наличия прошивок в системе
dmesg | grep firmware
