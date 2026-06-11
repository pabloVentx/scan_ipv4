# scan_ipv4
Script definido bash usado para el descubrimiento de hosts activos en redes IPv4 mediante trazas ICMP con el comando "Ping".
Muy rápido y optimizado.

Diseñado específicamente para fases de reconocimiento de hosts, laboratorios de ciberseguridad (CTFs), etc... donde se requiere una de una enumeración manual, ligera y veloz. Útil si existen varios hosts a escanear en la máquina objetivo.

## ✨ Características

* ⚡ **Ultra rápido (Multihilo):** Lanza las solicitudes de ping en segundo plano de forma paralela, logrando escanear una subred `/24` completa en cuestión de 1 o 2 segundos.
* 🪟🐧 **Detección pasiva de SO (OS Fingerprinting):** Analiza el valor del TTL (*Time To Live*) de las trazas ICMP devueltos para identificar si el host objetivo es una máquina Linux (TTL ~64) o Windows (TTL ~128).
* 🛠️ **Sin dependencias externas:** Utiliza exclusivamente utilidades nativas de sistemas Linux/Unix (`ping`, `bash`, `timeout`), ideal para entornos restringidos o *shells* limitadas.
* 🧼 **Salida limpia y ordenada:** Implementa ordenamiento numérico natural mediante `sort -V`. Esto asegura que el listado de IPs se imprima en pantalla de forma consecutiva (ej. `.1`, `.2`, `.15`...) facilitando su lectura y la exportación a otras herramientas.

## 🚀 Uso Rápido

1. **Clona el repositorio** en tu máquina o copia el código directamente:

git clone [https://github.com/pabloVentx/scan_ipv4.git](https://github.com/pabloVentx/scan_ipv4.git)

2.Dale permisos de ejecución al script:

```bash
chmod +x scan_ipv4.sh

3.Ejecútalo (puedes editar la subred objetivo directamente en el bucle del script según el entorno donde te encuentres):

```bash
./scan_ipv4.sh
