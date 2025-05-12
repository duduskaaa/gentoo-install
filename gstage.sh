#!/bin/bash

set -e
cd /mnt/gentoo

echo "[+] INSTALL & UNTAR STAGE PACKAGE"
wget https://distfiles.gentoo.org/releases/amd64/autobuilds/20250504T164008Z/stage3-amd64-openrc-20250504T164008Z.tar.xz
tar xpvf stage3-amd64-openrc-202504T164008Z.tar.xz --xattrs-include='*.*' --numeric-owner
