#!/bin/bash
#Copiar los archivos del primer parámetro en curso/miscopias
#Reintentar si falla el montaje al cabo de una hora
if [ $# -eq 0 ]
    then
        echo Faltan parámetros
	exit 1
fi
#variables para ir usando
hora_actual=$(date +%H)
hora=$(($hora_actual + 1))
minuto=$(date +%M)
carpeta=/home/jefe/curso/
#ejecución
if [ -f "$carpeta"index.txt ]; then
	while [ $# -ge 1 ]
   	do
        	echo Copiando archivo
        	cp -v $1 $carpeta
        	shift
	done
   else
	sudo mount -a
	if [ ! -f $carpeta/index.txt ]; then
		echo "$0" | at $hora:$minuto
	fi
fi
