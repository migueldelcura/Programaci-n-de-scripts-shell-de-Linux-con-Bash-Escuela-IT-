#!/bin/bash
#Para eliminar archivos cuya inicial se introduzca como parámetro
if [ "$1" = "" ]
	then
	echo Falta el parámetro
	echo -e "Escriba ./if_pruebas.sh \e[3mInicial del archivo\e[0m" #ponemos códigos de cursiva
	exit 1 #Terminamos mal
fi

lista=${1:0:1} #cogemos solo el primer carácter del parámetro 1 (posición cero, longitud 1)
ls -l $lista* &> /dev/null
if [ $? != 0 ]
  then
	echo no hay archivos que empiecen por \"$lista\"
	exit 2 # Salimos mal
fi

ls -l $lista*
echo Borrar todo? s/n
read si
if [ "$si" = s ]
     then
	rm $lista*
	echo Borrado
	exit 0 #Terminamos bien
fi
echo "Cancelado"
