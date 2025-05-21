#!/bin/bash

set -euo pipefail

echo "[+] ADD TIMEZONE"
ln -sf /usr/share/zoneinfo/Asia/Aqtobe /etc/localtime

echo "[+] ADD & GENERATE LOCALES"
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" > /etc/locale.conf
