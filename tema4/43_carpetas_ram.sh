#!/bin/bash
# para mover carpetas de una unidad RAM
ram="/tmp/ram"
directorio="/home/jefe/curso"
cd $ram
ls -1d */ > listado.borrable
while read dia
do
	for i in $(ls -1 $ram/$dia*) ; do #movemos los archivos
	lsof $i &> /dev/null
		if [ $? -ne 0 ]; then #0 si archivo abierto
                   mkdir -p "$directorio"/"$dia"
		   mv "$i" "$directorio"/"$dia"
		fi
	done
   rmdir $dia &> /dev/null #si queda vacía, la borramos
done < listado.borrable


