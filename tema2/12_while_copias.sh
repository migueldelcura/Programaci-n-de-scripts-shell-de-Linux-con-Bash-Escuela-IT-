#!/bin/bash
if [ $# -eq 0 ]
    then
        echo Faltan parámetros
        echo -e "Escriba $0 \"Directorio destino\" \"Archivos a copiar\""
        exit 1 #Terminamos mal

 elif [ "$2" = "" ]
    then
        echo Falta el segundo parámetro, el archivo/s
	echo -e "Escriba $0 \"Directorio destino\" \"Archivos a copiar\""
        exit 2 # Salimos mal
fi
carpeta="$1"
ls $2 &> /dev/null
if [ $? != 0 ]
   then
	echo no hay archivos $2
	exit 3 #Salimos mal
 elif [ ! -d $carpeta ]
   then
	echo no existe la carpeta $carpeta
	echo Creándola
	mkdir $carpeta
fi

while [ $# -gt 1 ]
   do
	echo Copiando archivo
	cp -v $2 $carpeta
	shift
done
