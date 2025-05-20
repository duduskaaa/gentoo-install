#!/bin/bash

set -euo pipefail

echo "[+] UPDATE PORTAGE TREE"
emerge --sync

echo "[+] UPDATE ALL INSTALLED PACKAGES"
emerge -uDN @world
