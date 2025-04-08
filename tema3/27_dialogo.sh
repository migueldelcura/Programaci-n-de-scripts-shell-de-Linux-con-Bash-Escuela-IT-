#!/bin/bash
leer (){
read -p "Nombre archivo 1: " nombre1
read -p "Nombre archivo 2: " nombre2
}

#caja de menú, la salida se almacena en la salida de errores stderr(2)
# Los números indican tamaños de ventana, número y orden de opciones
dialog --menu "Escoge:" 12 30 4 1 "ver archivos" 2 "copiar" 3 "Archivos a borrar" 4 "salir" 2>/tmp/output.tmp
#almacenamos el resultado anterior
salida=$(cat /tmp/output.tmp)
rm -f /tmp/output.tmp
if [ $salida -eq 1 ]; then
	leer
	cat $nombre1 $nombre2
  elif [ $salida -eq 2 ]; then
	leer
        cp -v $nombre1 $nombre2
  elif [ $salida -eq 3 ]; then
	dialog --checklist "Marca los archivos a borrar" 10 40 3 \
	1 usuarios_cesados on \
	2 usuarios_nuevos off \
	3 res.log off  2> /tmp/output2.tmp
	#Las opciones on estárán marcadas por defecto
	archivo=$(cat /tmp/output2.tmp)
	rm -f /tmp/output2.tmp
		for archivos in $archivo; do
			case $archivos in
				1) rm -v usuarios_cesados;;
				2) rm -v usuarios_nuevos;;
				3) rm -v res.log;;
			esac
		done
  elif [ $salida -eq 4 ]; then
	clear
	echo Adiós
	exit
fi

