#!/bin/bash
#Copiamos todo del servidor, porque lo eliminan cada día
#Los mantenemos en un almacén seis mese, los trasladamos a una reserva
#y al cabo de un año se borran
servidor=/mnt/servidor
almacen=/home/jefe/curso/almacen
reserva=/home/jefe/curso/almacen/reserva
#copia de archivos
cp -v "$servidor"/* "$almacen"/
#comprobaciones
#usamos el comando find, la f indica fichero
#mtime, fecha de modificación en días
for archivo in $(find "$almacen" -type f -mtime +180)
do
	mv "$archivo" "$reserva"
	echo Movido archivo "$archivo" >> "$almacen"/movidos_borrados.log
done

for viejo in $(find "$reserva" -type f -mtime +360)
do
	rm "$viejo"
	echo Borrado archivo "$viejo" >> "$almacen"/movidos_borrados.log
done
