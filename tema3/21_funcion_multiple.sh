#!/bin/bash
#Comando personalizado de copias
# -C para copiar con los dos siguientes parámetros: carpeta archivo
# -R para copiar como en el caso C, pero el archivo indicando solo parte del nombre
# -A para copiar como en el caso C, pero solo los que tengan fecha de hoy
# -H para que se muestre esta cabecera como ayuda
#$1 será uno de esos parámetros, $2 la carpeta y $3 el archivo/s
#salvo en las función copia
if [ $# -eq 0 ]
   then
        echo Faltan parámetros
        echo -e "Escriba $0 \e[3m -param Carpeta Archivo \e[0m"
        exit 1 #Terminamos mal
   elif [ "$1" = "-H" ]
   then
        echo --------AYUDA---------
        head -n 6 $0 | sed '1d'
        exit 0 #Sale bien
   elif [ "$2" = "" ]
   then
	echo Falta indicar la carpeta
	echo -e "Escriba $0 \e[3m -param Carpeta Archivo \e[0m"
	exit 2
   elif [ "$3" = "" ]
   then
	echo Falta el archivo
	exit 3
fi

carpeta="$2" #no quiero que shift afecte a la carpeta

copia () {
  ls -l $1 &> /dev/null
  if [ $? != 0 ]
    then
        echo No hay archivos  $1
        exit 1 # Salimos mal

  elif [ ! -d "$2" ]
    then
	echo La carpeta no existe, la crearemos.
        mkdir "$2"
        echo Creada
  fi
  echo Copiando archivos en $2
  cp -v $1 "$2"
  #echo Terminado
}

case "$1" in
	-C) while [ $# -ge 3 ]; do
		copia "$3" "$carpeta"
		shift #si se usan comodines hay que reducir parámetros
	    done ;;
	-R) while [ $# -ge 3 ]; do
	    	copia "*$3*" "$carpeta"
		shift #si se usan comodines hay que reducir parámetros
	    done ;;
	-A) while [ $# -ge 3 ]; do
		recientes=$(find -maxdepth 1 -name "$3" -mtime -1)
		copia "$recientes" "$carpeta"
		shift
	    done ;;
	*) echo Error inesperado
	   exit 100 ;;
esac



