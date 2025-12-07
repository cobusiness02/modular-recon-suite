#!/bin/bash
target=$1
echo "[*] Probing HTTP services on $target..."
echo "$target" | httpx -title -status-code -ip