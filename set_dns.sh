#!/bin/bash

# Custom DNS servers
DNS1=""
DNS2=""

# Google DNS servers
GOOGLE_DNS1="8.8.8.8"
GOOGLE_DNS2="8.8.4.4"

# Cloudflare DNS servers
CLOUDFLARE_DNS1="1.1.1.1"
CLOUDFLARE_DNS2="1.0.0.1"

# Function to set DNS on Linux
set_dns_linux() {
    local dns1=$1
    local dns2=$2
    echo "Setting DNS for Linux..."
    sudo sed -i 's/#*DNS=.*/DNS='"$dns1 $dns2"'/' /etc/systemd/resolved.conf
    sudo systemctl restart systemd-resolved
}

# Function to set DNS on macOS
set_dns_mac() {
    local dns1=$1
    local dns2=$2
    echo "Setting DNS for macOS..."
    networksetup -setdnsservers Wi-Fi $dns1 $dns2
}

# Function to remove DNS on Linux
remove_dns_linux() {
    echo "Removing DNS on Linux..."
    sudo sed -i '/DNS=/d' /etc/systemd/resolved.conf
    sudo systemctl restart systemd-resolved
}

# Function to remove DNS on macOS
remove_dns_mac() {
    echo "Removing DNS on macOS..."
    networksetup -setdnsservers Wi-Fi empty
}

# Detect the OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
else
    echo "This script is not supported on this OS."
    exit 1
fi

# Main menu
echo "Detected $OS"
echo "1) Set custom DNS"
echo "2) Set Google DNS"
echo "3) Set Cloudflare DNS"
echo "4) Remove DNS"
echo "Enter your choice: "
read -r choice

if [[ "$OS" == "Linux" ]]; then
    case $choice in
        1) set_dns_linux $DNS1 $DNS2 ;;
        2) set_dns_linux $GOOGLE_DNS1 $GOOGLE_DNS2 ;;
        3) set_dns_linux $CLOUDFLARE_DNS1 $CLOUDFLARE_DNS2 ;;
        4) remove_dns_linux ;;
        *) echo "Invalid choice." ;;
    esac
elif [[ "$OS" == "macOS" ]]; then
    case $choice in
        1) set_dns_mac $DNS1 $DNS2 ;;
        2) set_dns_mac $GOOGLE_DNS1 $GOOGLE_DNS2 ;;
        3) set_dns_mac $CLOUDFLARE_DNS1 $CLOUDFLARE_DNS2 ;;
        4) remove_dns_mac ;;
        *) echo "Invalid choice." ;;
    esac
fi

