#!/bin/bash
#copiaremos el primer parámetro en el servidor samba
#antes montaremos la unidad
if [ $# -eq 0 ]
   then
	echo No pusiste parámetro
	exit 1
fi

mount -t cifs -o username=angel,password=angel //192.168.15.24/datos /home/jefe/servidor

if [ $? -ne 0 ]
   then
	echo Error de montaje
	exit 2
fi

while [ $# -gt 0 ]
   do
	cp -v "$1" /home/jefe/servidor
	shift
done
