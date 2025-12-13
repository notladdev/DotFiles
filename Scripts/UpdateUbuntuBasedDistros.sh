#!/bin/bash

echo
echo "Updating package list..."
sudo apt update
echo

echo "Fixing broken installations and pending configurations..."
sudo dpkg --configure -a
sudo apt --fix-broken install -y
echo

echo "Upgrading installed packages..."
sudo apt upgrade -y
echo

echo "Applying full upgrade..."
sudo apt full-upgrade -y
echo

echo "Applying distribution upgrade (optional compatibility changes)..."
sudo apt dist-upgrade -y
echo

echo "Removing unnecessary packages..."
sudo apt autoremove --purge -y
echo

echo "Cleaning up partial package files..."
sudo apt autoclean
echo

echo "Cleaning up retrieved package files..."
sudo apt clean
echo

if command -v flatpak >/dev/null 2>&1; then
    echo "Updating Flatpak packages..."
    sudo flatpak update -y
    echo
fi

echo "System update completed."
echo