#!/bin/bash
#Para copiar archivos cuya extensión se introduzca como parámetro
if [ $# -eq 0 ]
    then
	echo Faltan parámetros
	echo -e "Escriba $0 \"Extensión que quiere copiar\" \"Directorio\""
	exit 1 #Terminamos mal

 elif [ "$2" = "" ]
    then
	echo Falta el segundo parámetro, el directorio
	echo -e "Escriba $0 \"Extensión que quiere copiar\" \"Directorio\""
	exit 2 # Salimos mal
fi

ls -l *$1 &> /dev/null
if [ $? != 0 ]
   then
        echo No hay archivos de extensión $1
        exit 3 # Salimos mal
fi

if [ -d $2 ]
  then
        echo Copiando archivos en $2
	cp -v *$1 $2
	echo Terminado
        exit 0 # Salimos bien
  else
	echo La carpeta no existe, la crearemos.
	mkdir $2
	echo Creada
	echo Copiando archivos en $2
        cp -v *$1 $2
        echo Terminado
        exit 0 # Salimos bien
fi       #Este último if no es muy largo?
