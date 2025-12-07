#!/bin/bash

# Modular Recon Suite v2
# Usage: ./recon.sh <target> <module>
# Modules: subdomains, ports, http, tech

target=$1
module=$2

if [ -z "$target" ] || [ -z "$module" ]; then
    echo "Usage: $0 <target> <module>"
    echo "Modules: subdomains, ports, http, tech"
    exit 1
fi

module_script="./modules/${module}.sh"

if [ -x "$module_script" ]; then
    "$module_script" "$target"
else
    echo "Invalid module: $module"
    echo "Valid modules: subdomains, ports, http, tech"
    exit 1
fi