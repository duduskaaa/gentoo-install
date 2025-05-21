#!/bin/bash
set -euo pipefail

ECHO="[+]"  # Для удобства, можно так

echo "[+] DETECTING WI-FI INTERFACE..."

WIFI_IFACE=$(iw dev | awk '$1=="Interface"{print $2; exit}')
if [[ -z "$WIFI_IFACE" ]]; then
  echo "[-] NO WI-FI INTERFACE FOUND. CHECK YOUR HARDWARE OR DRIVERS."
  exit 1
fi

echo "[+] USING INTERFACE: $WIFI_IFACE"

SSID="YOUR_SSID"
PASS="YOUR_PASSWORD"

echo "[+] STARTING WPA_SUPPLICANT..."
wpa_supplicant -B -i "$WIFI_IFACE" -c <(wpa_passphrase "$SSID" "$PASS")

echo "[+] STARTING DHCP CLIENT..."
dhcpcd "$WIFI_IFACE"

