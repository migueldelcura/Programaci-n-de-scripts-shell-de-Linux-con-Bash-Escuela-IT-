#!/bin/bash
#Para copiar los sh de la carpeta actual
# buscando los que cumplan un criterio
if [ $# -eq 0 ]
    then
	echo Falta el parámetro
	echo Ejecute de nuevo $0 indicando el criterio de búsqueda
	exit 1
fi

#uniq, es un comando para eliminar repeticiones en las cadenas de caracteres
busco=$(grep "$1" ~/curso/*sh | cut -d ":" -f 1 | uniq)
#Ojo, no poner entre comillas $busco
for i in $busco
do
	mkdir -p /home/$USERNAME/Escritorio/seleccionados
	cp -v "$i" /home/$USERNAME/Escritorio/seleccionados
done
echo Terminado
exit
