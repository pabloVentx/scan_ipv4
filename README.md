# scan_ipv4
Script definido bash usado para el descubrimiento de hosts activos en redes IPv4 mediante trazas ICMP con el comando "Ping".
Un script en Bash ultra rápido, concurrente y optimizado para el descubrimiento de hosts activos (*Host Discovery*) en redes IPv4 mediante *ICMP Ping Sweeps*.

Diseñado específicamente para fases de **auditoría interna, laboratorios de ciberseguridad (como el eJPTv2 o laboratorios de TryHackMe) y pivotaje**, donde las herramientas automáticas tradicionales como Nmap no están disponibles en la máquina comprometida o se requiere una de una enumeración manual, ligera y veloz.

## ✨ Características

* ⚡ **Ultra rápido (Multihilo):** Lanza las solicitudes de ping en segundo plano de forma paralela, logrando escanear una subred `/24` completa en cuestión de 1 o 2 segundos.
* 🛠️ **Sin dependencias externas:** Utiliza exclusivamente utilidades nativas de sistemas Linux/Unix (`ping`, `bash`, `timeout`), ideal para entornos restringidos o *shells* limitadas.
* 🧼 **Salida limpia y ordenada:** Implementa ordenamiento numérico natural mediante `sort -V`. Esto asegura que el listado de IPs se imprima en pantalla de forma consecutiva (ej. `.1`, `.2`, `.15`...) facilitando su lectura y la exportación a otras herramientas.

## 🚀 Uso Rápido

1. **Clona el repositorio** en tu máquina o copia el código directamente:

git clone [https://github.com/pabloVentx/scan_ipv4.git](https://github.com/pabloVentx/scan_ipv4.git)
cd scan_ipv4
Dale permisos de ejecución al script:


chmod +x scan_ipv4.sh
Ejecútalo (puedes editar la subred objetivo directamente en el bucle del script según el entorno donde te encuentres):

```
./scan_ipv4.sh
```
