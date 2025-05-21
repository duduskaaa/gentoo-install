#!/bin/bash
set -euo pipefail

echo "[+] SYNCING PORTAGE TREE"
if ! emerge --sync; then
  echo "[-] FAILED TO SYNC PORTAGE TREE" >&2
  exit 1
fi

echo "[+] UPDATING WORLD SET (WITH DEPENDENCIES AND USE FLAGS)"
if ! emerge -uDN @world; then
  echo "[-] UPDATE FAILED, CHECK LOGS" >&2
  exit 1
fi

echo "[+] UPDATE COMPLETE"
