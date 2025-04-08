#!/bin/bash
#Queremos copiar los archivos del directorio actual de 10 en 10 en diferentes sitios
#Primero obtenemos el listado de archivos a copiar.
ls -p | grep -v / > listado.borrable #-p añade símbolo / a los directorios -v filtra por ese símbolo
cont=$(wc listado.borrable | cut -d " " -f 2) #para saber el nº de archivos
if [ $cont -gt 100 ]
   then
        echo Hay más de 100 ficheros, solo se copiarán los primeros 100.
        read -n 1 -p "¿Desea continuar? s/n " si
	#if [ "$si" != "s" ] && [ "$si" != "S" ]; then
        if [[ $si != [sS] ]]; then
           echo Anulado
           exit
        fi
fi

#El while dura mientras haya archivos que copiar
while [ -s listado.borrable ]; do
   for num in {1..10}
   do
  	echo copiando
	copias=$(head -n 1 listado.borrable)
	#A medida de que se va copiando uno, se elimina de la lista
	sed -i '1d' listado.borrable
	cp  -v "$copias" "carpeta$num"
   done
done
echo Terminado
