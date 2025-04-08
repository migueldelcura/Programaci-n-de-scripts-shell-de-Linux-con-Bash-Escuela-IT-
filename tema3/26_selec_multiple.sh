#!/bin/bash
clear
ayuda (){
echo Las opciones piden dos nombres de archivo,
echo pero para copiar o borrar se pueden usar comodines.
}
leer (){
read -p "Nombre archivo 1: " nombre1
read -p "Nombre archivo 2: " nombre2
}
PS3="Hola $USERNAME escoge: "
select algo in copiar borrar renombrar ayuda salir
do
   case $algo in
	copiar)
		echo Indica el archivo a copiar y su destino:
		leer
		cp -v $nombre1 $nombre2;;
	borrar)
		echo Indica hasta dos archivos a eliminar:
		leer
		rm -v $nombre1 $nombre2;;
	renombrar)
		echo Indica el archivo a renombrar, y el nuevo nombre:
		leer
		mv $nombre1 $nombre2;;
	ayuda)
		ayuda;;
	salir)
		echo Saliendo
	        break;;
	*)
		echo La opción $REPLY no es válida
   esac
done
