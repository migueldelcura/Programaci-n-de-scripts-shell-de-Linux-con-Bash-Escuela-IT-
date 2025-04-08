#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
echo Vamos a actualizar
sleep 2 #Una prueba de retardo
echo Actualizando
(apt update && apt upgrade -y) &>> actualiza.log
echo Terminado
