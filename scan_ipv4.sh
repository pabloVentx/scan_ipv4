#!/bin/bash

for i in {1..255}; do
    (
        timeout 1 bash -c "ping -c 1 10.10.10.$i >/dev/null 2>&1"
        if [ $? -eq 0 ]; then
            echo "10.10.10.$i" # Solo imprimimos la IP para poder ordenarla bien
        fi
    ) & 
done | sort -V # Ordena las IPs en orden numérico

wait
