#!/bin/bash
valor_mi_zona=$(date +%z)
mi_zona=$(date +%Z)
matriz=($(ssh jefe@192.168.15.24 -p 33030 "bash -c" "'date +%z; date +%Z'"))
valor_otra_zona=${matriz[0]}
su_zona=${matriz[1]}
diferencia=$((${valor_mi_zona:1}-${valor_otra_zona:1}))
echo La diferencia de horas es $diferencia horas
echo Nosotros estamos en la zona $mi_zona y ellos en $su_zona
echo FIN
