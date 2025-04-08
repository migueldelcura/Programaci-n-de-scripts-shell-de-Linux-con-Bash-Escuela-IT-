#!/bin/bash
#Para copiar los warnings de syslog
if [ $# -eq 0 ]
    then
	echo Falta el parámetro
	echo Ejecute de nuevo $0 indicando el Mes de búsqueda
	exit 1
fi

sel=$(grep warning /var/log/syslog | grep "$1")

echo -e "$sel \n"
echo -e "$sel \n" > warnings.txt
# el \n es para introducir intro


