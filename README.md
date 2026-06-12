# Herramienta: scan_ipv4
Script definido en bash usado para el descubrimiento de hosts activos en redes IPv4 mediante trazas ICMP con el comando "Ping".
Muy rápido y optimizado.

Diseñado específicamente para fases de reconocimiento de hosts en laboratorios de ciberseguridad (CTFs), etc... donde se requiere una de una enumeración manual, ligera y veloz. Útil si existen varios hosts a escanear en la máquina objetivo.

## Características

* **Ultra rápido (Multihilo):** Lanza las solicitudes de ping en segundo plano de forma paralela, logrando escanear una subred `/24` completa en cuestión de 1 o 2 segundos.
* **Detección pasiva de SO (OS Fingerprinting):** Analiza el valor del TTL (*Time To Live*) de las trazas ICMP devueltos para identificar si el host objetivo es una máquina Linux (TTL ~64) o Windows (TTL ~128).
* **Sin dependencias externas:** Utiliza exclusivamente utilidades nativas de sistemas Linux/Unix (`ping`, `bash`, `timeout`), ideal para entornos restringidos o *shells* limitadas.
* **Salida limpia y ordenada:** Implementa ordenamiento numérico natural mediante `sort -V`. Esto asegura que el listado de IPs se imprima en pantalla de forma consecutiva (ej. `.1`, `.2`, `.15`...) facilitando su lectura y la exportación a otras herramientas.

## Instrucciones: Ejecución del Script

1. **Clona el repositorio** en tu máquina o copia el código directamente:

```
git clone https://github.com/pabloVentx/scan_ipv4.git
```

2. **Dale permisos** de ejecución al script:

```
chmod +x scan_ipv4.sh
```

3. **Ejecútalo** (Importante editar la subred objetivo directamente en el bucle del script según el entorno donde te encuentres, default: 10.10.10.X):

```
./scan_ipv4.sh
```


## Importante: Comportamiento frente a Firewalls (Caso de estudio: Windows)

Al realizar fases de reconocimiento y descubrimiento de hosts mediante protocolos como ICMP (Ping), es fundamental entender cómo afectan las reglas de seguridad de los sistemas operativos.

### Bloqueo de ICMP por defecto
Por defecto, el **Firewall de Microsoft Defender** (y muchas soluciones de seguridad corporativas) viene configurado para descartar silenciosamente las trazas de tipo `ICMP`. 
* **Resultado:** Aunque la máquina objetivo esté encendida y activa en la red, este script (`scan_ipv4.sh`) la marcará como inactiva debido a la falta de respuesta (*Timeout*).

---

### Técnicas de Evasión y Alternativas

Cuando un escaneo ICMP devuelva una red aparentemente vacía o falten hosts que sabemos que existen, debemos acudir a las siguientes técnicas [Algunas de muchas]:

#### 1. Escaneo en Capa 2 (ARP) 
Las peticiones ARP son indispensables para la comunicación básica en redes locales (conectar IPs con direcciones MAC). Ningún sistema operativo puede bloquear el tráfico ARP local sin quedar completamente aislado e incomunicado.
* **Herramienta recomendada:** `arp-scan`, `netdiscover` o `nmap -sn Dir. red/24`.

#### 2. Escaneo sin Ping en Capa 4 (TCP SYN)
Como el firewall bloquea el ping, tenemos que ordenarle a Nmap que no compruebe si el host está vivo y pase directamente a escanear los puertos que correspondan de dicha IP.

Parámetro clave: -Pn (No ping).

Herramienta recomendada: `Nmap`.
