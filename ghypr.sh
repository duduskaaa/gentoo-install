#!/bin/bash

set -e

echo "[+] INSTALL HYPRLAND & DEPENDENCIES"
sudo emerge --ask \
    wayland \
    wayland-protocols \
    wlroots \
    hyprland \
    wofi \
    swaylock \
    grim \
    slurp \
    xdg-desktop-portal-wlr \
    xdg-utils \
    polkit \
    kitty \
    lf \
    pipewire \
    libinput \
    mesa \
    media-video/intel-media-driver

