#!/bin/bash

set -e
echo "[+] UPDATE PORTAGE TREE"
emerge --sync

echo "[+] UPDATE ALL INSTALLED PACKAGES"
emerge -uDN @world
