#!/bin/bash
#copiar un archivo en otro, si el destino existe,
#si no esperar 5 min.
while :
do
   if [ -f "$2" ]
   	then
		cp -v "$1" "$2"
		echo Archivo copiado
		exit 0
	else
		echo No se ha podido hacer aún la copia!
		sleep 5
   fi
done
