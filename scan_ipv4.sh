#!/bin/bash

{
    for i in {1..255}; do
        (
            ping_output=$(ping -c 1 -W 1 10.10.10.$i 2>/dev/null)
            
            if [ $? -eq 0 ]; then
                # Extraemos el TTL numérico
                ttl=$(echo "$ping_output" | grep -oP "ttl=\d+" | awk -F= '{print $2}')
                
                # Clasificación avanzada por rangos de TTL
                if [ "$ttl" -le 64 ]; then
                    os="Linux"
                elif [ "$ttl" -le 128 ]; then
                    os="Windows"
                elif [ "$ttl" -le 255 ]; then
                    os="Router / Network Device (Cisco/Unix)"
                else
                    os="Desconocido"
                fi
                
                echo "10.10.10.$i (TTL: $ttl -> $os)"
            fi
        ) &
    done
    wait
} | sort -V
