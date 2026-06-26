#!/bin/bash

{
    for i in {1..255}; do
        (
            ip="10.10.10.$i"
            # Ejecutamos el ping y guardamos la salida directamente
            ping_output=$(ping -c 1 -W 1 "$ip" 2>/dev/null)
            
            # Comprobamos si la salida de ping contiene texto (si respondió)
            if [ -n "$ping_output" ]; then
                # Extraemos el TTL de forma segura
                ttl=$(echo "$ping_output" | grep -oP 'ttl=\d+' | awk -F= '{print $2}')
                
                # Si por alguna razón no se captura el TTL, saltamos para evitar errores
                if [ -z "$ttl" ]; then continue; fi

                # Clasificación por rangos de TTL
                if [ "$ttl" -le 64 ]; then
                    os="Linux"
                elif [ "$ttl" -le 128 ]; then
                    os="Windows"
                elif [ "$ttl" -le 255 ]; then
                    os="Router / Network Device (Cisco/Unix)"
                else
                    os="Desconocido"
                fi
                
                echo "$ip (TTL: $ttl -> $os)"
            fi
        ) &
    done
    wait
} | sort -V
