#!/bin/bash
#Este script comprueba el espacio libre en disco
#Lo ejecutaremos en el minuto 21 de cada hora
#Haremos un crontab en /etc/cron.d/ para ello
espacio=$(df -h | grep sda1 | tr -s " " | cut -d " " -f 4)
echo Queda libre $espacio # >> /home/jefe/Escritorio/scripts/espacio.log
date >> /home/jefe/Escritorio/scripts/espacio.log
