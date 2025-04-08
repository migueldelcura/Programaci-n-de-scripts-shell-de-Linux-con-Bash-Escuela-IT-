#!/bin/bash
#Para copiar archivos, previa contraseña
if [ "$1" != miclave ]
    then
	exit 100 #Fallo de contraseña
 elif [ "$2" = "" ]
    then
	echo Falta el segundo parámetro, el directorio
	echo -e "Escriba $0 \"Clave\" \"Directorio\" \"Archivo que quiere copiar\""
	exit 1 # Salimos mal
 elif [ "$3" = "" ]
    then
	echo Falta el tercer parámetro, el archivo
        echo -e "Escriba $0 \"Clave\" \"Directorio\" \"Archivo que quiere copiar\""
	exit 2 # Salimos mal
fi

if [ ! -f $3 ]
   then
        echo No se encuentra el archivo $3
        exit 3 # Salimos mal
fi

if [ ! -d $2 ]
  then
	echo La carpeta no existe, la crearemos.
        mkdir $2
        echo Creada
fi
echo Copiando archivo
cp -v $3 $2
echo Terminado

