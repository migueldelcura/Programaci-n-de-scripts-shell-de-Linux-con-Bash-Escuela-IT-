#!/bin/bash
#Para copiar archivos de una lista de nombres
#en una carpeta que ya exista
if [ $# -eq 0 ]
    then
	echo Falta el parámetro
	read -p "¿Desea introducirlo ahora? s/n " si
	if [ "$si" = s ]
	     then
		read -p "Bien, introdúzcalo ahora: " kk
	 	set $1 $kk
	     else
		echo Adiós
		exit 1
	fi
fi

while read orig
do
	cp -v "$orig" "$1"/
done < archivos.txt
