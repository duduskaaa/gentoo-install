#!/bin/bash

set -e

echo "[+] ADD TIMEZONE"
ln -sf /usr/share/zoneinfo/Asia/Aqtobe /etc/localtime

echo "[+] ADD & GENERATE LOCALES"
nano /etc/locale.gen
locale-gen
echo "LANG=ru_RU.utf8" > /etc/locale.conf
