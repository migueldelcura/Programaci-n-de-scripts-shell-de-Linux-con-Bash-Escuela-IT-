#!/bin/bash
#Comprobaremos la carpeta curso/comprobar/ y si tiene archivos los llevaremos
#hacia curso/depósito
#Fijamos variables de directorios para facilitar el manejo
directorio=/home/jefe/curso/comprobar/
destino=/home/jefe/curso/deposito/
#Comprobación
vacio=$(ls "$directorio")
if [ "$vacio" = "" ]
   then
	echo Directorio vacío
   else
	echo Directorio ocupado
	mv "$directorio"* "$destino"
	echo Movidos
fi
