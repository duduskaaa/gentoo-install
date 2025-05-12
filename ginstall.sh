#!/bin/bash

set -e
./gnet.sh
./gmkfs.sh
./gmount.sh
./gstage.sh 
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
