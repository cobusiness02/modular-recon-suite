#!/bin/bash

# Modular Recon Suite v1
# Usage: ./recon.sh <target> <module>
# Modules: subdomains, ports, http, tech

target=$1
module=$2

if [ -z "$target" ] || [ -z "$module" ]; then
    echo "Usage: $0 <target> <module>"
    echo "Modules: subdomains, ports, http, tech"
    exit 1
fi

case $module in
    subdomains)
        echo "[*] Enumerating DNS nameservers for $target..."
        dig NS "$target" +short
        ;;

    ports)
        echo "[*] Running Nmap fast scan on $target..."
        nmap -T4 -F "$target"
        ;;

    http)
        echo "[*] Probing HTTP services on $target..."
        echo "$target" | httpx -title -status-code -tech-detect -ip
        ;;

    tech)
        echo "[*] Fingerprinting technologies with WhatWeb on $target..."
        whatweb "$target"
        ;;

    *)
        echo "Invalid module: $module"
        echo "Valid modules: subdomains, ports, http, tech"
        exit 1
        ;;
esac