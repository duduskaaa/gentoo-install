#!/bin/bash

set -euo pipefail

echo "[+] FILL -> /etc/fstab WITH A UUID"
cat <<EOF > /mnt/gentoo/etc/fstab
# <fs>          			 	<mountpoint>  <type>  <opts>        <dump/pass>
UUID=ED3C-1BE0    				/boot/efi     vfat    defaults,noatime  0 2
UUID=0801b164-e53a-46f1-9796-ba7da14ce5f7       /             ext4    noatime         0 1
UUID=2a1a6d05-470f-4274-ae73-de36ac0e952c       /home         ext4    defaults         0 2
EOF
