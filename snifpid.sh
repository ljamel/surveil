#!/bin/bash

# Ce script permet d'écouter le réseau et d'afficher le service et le pid utilisé.

while true; do
    echo "Écoute en cours..."
    netstat -anp | grep -e "tcp" -e "udp"
    echo "Service et PID utilisés:"
    netstat -anp | grep -e "tcp" -e "udp" | awk '{print $4 " " $7}' | cut -d ":" -f 2 | sort | uniq
    sleep 1
done
