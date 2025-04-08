#!/bin/bash
#Cuenta las líneas de los dos archivos indicados como parámetros y las suma
# O indica la media de tamaño que consumen los archivos de la carpeta actual
source calcular.sh
if [ $# -eq 0 ]
   then
	tamano=$(du -s | cut -f 1) #cut delimita por tabulador por defecto
	n_archivos=$(ls -l | wc -l)
	calculo $tamano $n_archivos
	echo la media es $division bytes
	exit 0
fi

primero=$(wc "$1" -l | cut -d " " -f 1)
segundo=$(wc "$2" -l | cut -d " " -f 1)
calculo $primero $segundo
echo la suma es $suma
