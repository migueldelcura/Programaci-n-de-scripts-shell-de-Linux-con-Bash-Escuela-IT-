#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
echo Iniciando copia
cp -r /etc/ssh/ ~/Descargas/ >> ~/copias.log
#Alternativa: /home/$USERNAME/Descargas
date >> ~/copias.log
echo Finalizado
