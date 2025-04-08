#!/bin/bash
if [ $# = 0 ]
   then
	echo Falta el nombre del paquete
	exit
fi
dpkg -s $1 > /dev/null
if [ $? != 0 ]
   then
	echo Paquete $1 no instalado
	apt-cache policy $1
	read -p "Procedemos a instalarlo? " si
		case $si in
		   [sS]) sudo apt install $1;;
		esac
   else
	echo El paquete ya está instalado
	exit
fi
echo FIN
