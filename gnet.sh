#!/bin/bash

set -e

echo "[+] CONNECT TO WIFI"
echo 'wpa_supplicant -B -i "DEVICE" -c <(wpa_passphrase "ID" "PASSWORD")'
eho 'dhcpcd "DEVICE"'
