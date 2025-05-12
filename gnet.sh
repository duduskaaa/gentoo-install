#!/bin/bash

set -e
wpa_supplicant -B -i "DEVICE" -c <(wpa_passphrase "12123456" "12345699")
dhcpcd "DEVICE"
