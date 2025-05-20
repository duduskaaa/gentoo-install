#!/bin/bash

set -euo pipefail

./gnet.sh
./gmkfs.sh
./gmount.sh
./gstage.sh 
#.gmakeconf -> After chroot again?
./gchroot.sh
./gmakeconf.sh
./gworld.sh
./gprofile
./glocal.sh
./guser.sh
./gfirmware.sh
./gkernel.sh
./gfstab.sh
./gboot.sh
