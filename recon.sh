#!/bin/bash

# Modular Recon Suite by cobusiness02
# Usage: ./recon.sh <domain> [module]

domain=$1
module=$2

if [[ -z "$domain" ]]; then
  echo "Usage: $0 <domain> [module]"
  echo "Modules: subdomains, ports, http, tech"
  exit 1
fi

case $module in
  subdomains)
    echo "[*] Enumerating subdomains for $domain..."
    dig +short -t ns $domain
    ;;
  ports)
    echo "[*] Scanning ports for $domain..."
    nmap -Pn -T4 -F $domain
    ;;
  http)
    echo "[*] Probing HTTP services on $domain..."
    echo $domain | httpx -silent -title -status-code -tech-detect -ip -no-color
    ;;
  tech)
    echo "[*] Fingerprinting tech stack for $domain..."
    whatweb $domain
    ;;
  *)
    echo "Unknown module. Use: subdomains, ports, http, tech"
    ;;
esac